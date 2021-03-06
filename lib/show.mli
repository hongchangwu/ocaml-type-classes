module type S = sig
  type t

  val show : t -> string
end

val bool : (module S with type t = bool)
val char : (module S with type t = char)
val float : (module S with type t = float)
val int : (module S with type t = int)
val string : (module S with type t = string)
val option : (module S with type t = 'a) -> (module S with type t = 'a option)
val list : (module S with type t = 'a) -> (module S with type t = 'a list)
