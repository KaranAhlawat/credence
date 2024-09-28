open Lwt.Syntax

type config =
  { success_redirect : string option
  ; failure_redirect : string
  ; failure_flash_message : bool
  }

module Make (Strategy : Strategy.S) = struct
  let authenticate config next req =
    match Strategy.authenticate req with
    | Ok user ->
      let* _ = Dream.set_session_field req "user" (Strategy.User.serialize user) in
      (match config.success_redirect with
       | Some url -> Dream.redirect req url
       | None -> next Types.{ request = req; user })
    | Error _ -> Dream.redirect req config.failure_redirect
  ;;

  let protected next req =
    let ( >>= ) = Option.bind in
    let user = "user" |> Dream.session_field req >>= Strategy.User.deserialize in
    match user with
    | Some user -> next Types.{ request = req; user }
    | None -> Dream.respond ~code:401 ~status:`Unauthorized ""
  ;;
end
