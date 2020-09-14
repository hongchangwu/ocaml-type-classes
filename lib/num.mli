module type S = sig
  type t

  val ( + ) : t -> t -> t
  val ( - ) : t -> t -> t
  val ( * ) : t -> t -> t
  val negate : t -> t
  val abs : t -> t
  val from_int : int -> t
end

val int : (module S with type t = int)
val float : (module S with type t = float)
