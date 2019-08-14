module type Num = sig
  type t

  val ( + ) : t -> t -> t
  val ( - ) : t -> t -> t
  val ( * ) : t -> t -> t
  val negate : t -> t
  val abs : t -> t
  val from_int : int -> t
end

val num_int : (module Num with type t = int)
val num_float : (module Num with type t = float)
