module type Num = sig
  type t
  val (+) : t -> t -> t
  val (-) : t -> t -> t
  val ( * ) : t -> t -> t
  val negate : t -> t
  val abs : t -> t
  val from_int : int -> t
end

module Num_int = struct
  type t = int
  let (+) = (+)
  let (-) = (-)
  let ( * ) = ( * )
  let negate = (~-)
  let abs = abs
  let from_int x = x
end
let num_int = (module Num_int : Num with type t = int)

module Num_float = struct
  type t = float
  let (+) = (+.)
  let (-) = (-.)
  let ( * ) = ( *. )
  let negate = (~-.)
  let abs = abs_float
  let from_int = float_of_int
end
let num_float = (module Num_float : Num with type t = float)
