module type Eq = sig
  type t
  val (==) : t -> t -> bool
  val (/=) : t -> t -> bool
end

module Eq_default = struct
  let (==) = (=)
  let (/=) = (<>)
end

module Eq_bool = struct
  type t = bool
  include Eq_default
end
let eq_bool = (module Eq_bool : Eq with type t = bool)

module Eq_char = struct
  type t = char
  include Eq_default
end
let eq_char = (module Eq_char : Eq with type t = char)

module Eq_float = struct
  type t = float
  include Eq_default
end
let eq_float = (module Eq_float : Eq with type t = float)

module Eq_int = struct
  type t = int
  include Eq_default
end
let eq_int = (module Eq_int : Eq with type t = int)

module Eq_list (E : Eq) = struct
  type t = E.t list
  let rec (==) xs ys = match xs, ys with
    | [], [] -> true
    | [], _ | _, [] -> false
    | x :: xs', y :: ys' -> E.(==) x y && (==) xs' ys'
  let (/=) xs ys = not @@ (==) xs ys
end
let eq_list (type a)
            (module E : Eq with type t = a) =
  (module Eq_list (E) : Eq with type t = a list)

module Eq_string = struct
  type t = string
  include Eq_default
end
let eq_string = (module Eq_string : Eq with type t = string)
