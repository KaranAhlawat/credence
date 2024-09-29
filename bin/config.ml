module M = struct
  open Credence.Strategy.Local

  module User = struct
    type t = { name : string }

    let serialize { name } = name
    let deserialize name = Some { name }
  end

  let verify params =
    (* Some checking ccode *)
    Ok User.{ name = params.username }
  ;;
end

include Credence.Strategy.Local.Make (M)
