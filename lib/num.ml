module type S = sig
  type t

  val ( + ) : t -> t -> t
  val ( - ) : t -> t -> t
  val ( * ) : t -> t -> t
  val negate : t -> t
  val abs : t -> t
  val from_int : int -> t
end

module Int = struct
  type t = int

  let ( + ) = ( + )
  let ( - ) = ( - )
  let ( * ) = ( * )
  let negate = ( ~- )
  let abs = abs
  let from_int x = x
end

let int = (module Int : S with type t = int)

module Float = struct
  type t = float

  let ( + ) = ( +. )
  let ( - ) = ( -. )
  let ( * ) = ( *. )
  let negate = ( ~-. )
  let abs = abs_float
  let from_int = float_of_int
end

let float = (module Float : S with type t = float)
