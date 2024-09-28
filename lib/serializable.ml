module type S = sig
  type t

  val serialize : t -> string
  val deserialize : string -> t option
end
