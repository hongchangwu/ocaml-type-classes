module type S = sig
  type t

  module E : Eq.S with type t = t

  val ( < ) : t -> t -> bool
  val ( <= ) : t -> t -> bool
  val ( >= ) : t -> t -> bool
  val ( > ) : t -> t -> bool
  val max : t -> t -> t
  val min : t -> t -> t
end

val bool : (module S with type t = bool)
val char : (module S with type t = char)
val float : (module S with type t = float)
val int : (module S with type t = int)
val list : (module S with type t = 'a) -> (module S with type t = 'a list)
val string : (module S with type t = string)
