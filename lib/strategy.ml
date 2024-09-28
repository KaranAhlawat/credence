module type S = sig
  module User : Serializable.S

  val authenticate : Dream.request -> (User.t, string) result
end

module Local = struct
  type params =
    { username : string
    ; password : string
    }

  module Make (M : sig
      module User : Serializable.S

      val verify : params -> (User.t, string) result
    end) : S with module User = M.User = struct
    module User = M.User

    let authenticate request =
      let params =
        { username = Dream.param request "username"; password = Dream.param request "password" }
      in
      M.verify params
    ;;
  end
end
