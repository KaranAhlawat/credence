open Passeport.Strategy.Local

module User = struct
  type t = { name : string }

  let serialize { name } = name
  let deserialize name = Some { name }
end

let verify (params : params) : (User.t, string) result =
  (* Some checking ccode *)
  Ok { name = params.username }
;;
