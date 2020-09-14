module type S = sig
  type t

  val ( == ) : t -> t -> bool
  val ( /= ) : t -> t -> bool
end

module Default = struct
  let ( == ) = ( = )
  let ( /= ) = ( <> )
end

module Bool = struct
  type t = bool

  include Default
end

let bool = (module Bool : S with type t = bool)

module Char = struct
  type t = char

  include Default
end

let char = (module Char : S with type t = char)

module Float = struct
  type t = float

  include Default
end

let float = (module Float : S with type t = float)

module Int = struct
  type t = int

  include Default
end

let int = (module Int : S with type t = int)

module List (E : S) = struct
  type t = E.t list

  let rec ( == ) xs ys =
    match xs, ys with
    | [], [] -> true
    | [], _ | _, [] -> false
    | x :: xs', y :: ys' -> E.( == ) x y && xs' == ys'
  ;;

  let ( /= ) xs ys = not @@ (xs == ys)
end

let list (type a) (module E : S with type t = a) =
  (module List (E) : S with type t = a list)
;;

module String = struct
  type t = string

  include Default
end

let string = (module String : S with type t = string)
