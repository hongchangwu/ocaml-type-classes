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

module Default = struct
  let ( < ) = ( < )
  let ( <= ) = ( <= )
  let ( >= ) = ( >= )
  let ( > ) = ( > )
  let max = max
  let min = min
end

module Minimal
    (E : Eq.S) (LE : sig
      val ( <= ) : E.t -> E.t -> bool
    end) =
struct
  open E
  open LE

  let ( < ) x y = (x /= y) && x <= y
  let ( >= ) x y = x == y || not (x <= y)
  let ( > ) x y = (x /= y) && not (x <= y)
  let max x y = if x <= y then y else x
  let min x y = if x <= y then x else y
end

module Bool = struct
  type t = bool

  module E = (val Eq.bool)
  include Default
end

let bool = (module Bool : S with type t = bool)

module Char = struct
  type t = char

  module E = (val Eq.char)
  include Default
end

let char = (module Char : S with type t = char)

module Float = struct
  type t = float

  module E = (val Eq.float)
  include Default
end

let float = (module Float : S with type t = float)

module Int = struct
  type t = int

  module E = (val Eq.int)
  include Default
end

let int = (module Int : S with type t = int)

module List (O : S) = struct
  type t = O.t list

  module E = (val Eq.list (module O.E))

  let rec ( <= ) xs ys =
    match xs, ys with
    | [], _ -> true
    | _, [] -> false
    | x :: xs', y :: ys' -> O.( <= ) x y && xs' <= ys'
  ;;

  include Minimal
            (E)
            (struct
              let ( <= ) = ( <= )
            end)
end

let list (type a) (module O : S with type t = a) =
  (module List (O) : S with type t = a list)
;;

module String = struct
  type t = string

  module E = (val Eq.string)
  include Default
end

let string = (module String : S with type t = string)
