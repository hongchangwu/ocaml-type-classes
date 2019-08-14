module type Show = sig
  type t

  val show : t -> string
end

module Show_bool = struct
  type t = bool

  let show = function
    | true -> "True"
    | false -> "False"
  ;;
end

let show_bool = (module Show_bool : Show with type t = bool)

module Show_char = struct
  type t = char

  let show x = "'" ^ Char.escaped x ^ "'"
end

let show_char = (module Show_char : Show with type t = char)

module Show_float = struct
  type t = float

  let show = string_of_float
end

let show_float = (module Show_float : Show with type t = float)

module Show_int = struct
  type t = int

  let show = string_of_int
end

let show_int = (module Show_int : Show with type t = int)

module Show_list (S : Show) = struct
  type t = S.t list

  let show xs =
    let rec show' f = function
      | [] -> ""
      | x :: xs -> (if f then "" else ",") ^ S.show x ^ show' false xs
    in
    "[" ^ show' true xs ^ "]"
  ;;
end

let show_list (type a) (module S : Show with type t = a) =
  (module Show_list (S) : Show with type t = a list)
;;

module Show_string = struct
  type t = string

  let show x = "\"" ^ x ^ "\""
end

let show_string = (module Show_string : Show with type t = string)
