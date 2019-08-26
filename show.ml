module type S = sig
  type t

  val show : t -> string
end

module Bool = struct
  type t = bool

  let show = function
    | true -> "True"
    | false -> "False"
  ;;
end

let bool = (module Bool : S with type t = bool)

module Char = struct
  type t = char

  let show x = "'" ^ Char.escaped x ^ "'"
end

let char = (module Char : S with type t = char)

module Float = struct
  type t = float

  let show = string_of_float
end

let float = (module Float : S with type t = float)

module Int = struct
  type t = int

  let show = string_of_int
end

let int = (module Int : S with type t = int)

module List (S : S) = struct
  type t = S.t list

  let show xs =
    let rec show' f = function
      | [] -> ""
      | x :: xs -> (if f then "" else ",") ^ S.show x ^ show' false xs
    in
    "[" ^ show' true xs ^ "]"
  ;;
end

let list (type a) (module S : S with type t = a) =
  (module List (S) : S with type t = a list)
;;

module String = struct
  type t = string

  let show x = "\"" ^ x ^ "\""
end

let string = (module String : S with type t = string)
