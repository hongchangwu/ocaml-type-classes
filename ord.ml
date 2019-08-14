open Eq

module type Ord = sig
  type t

  module E : Eq with type t = t

  val ( < ) : t -> t -> bool
  val ( <= ) : t -> t -> bool
  val ( >= ) : t -> t -> bool
  val ( > ) : t -> t -> bool
  val max : t -> t -> t
  val min : t -> t -> t
end

module Ord_default = struct
  let ( < ) = ( < )
  let ( <= ) = ( <= )
  let ( >= ) = ( >= )
  let ( > ) = ( > )
  let max = max
  let min = min
end

module Ord_minimal
    (E : Eq) (LE : sig
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

module Ord_bool = struct
  type t = bool

  module E = (val eq_bool)
  include Ord_default
end

let ord_bool = (module Ord_bool : Ord with type t = bool)

module Ord_char = struct
  type t = char

  module E = (val eq_char)
  include Ord_default
end

let ord_char = (module Ord_char : Ord with type t = char)

module Ord_float = struct
  type t = float

  module E = (val eq_float)
  include Ord_default
end

let ord_float = (module Ord_float : Ord with type t = float)

module Ord_int = struct
  type t = int

  module E = (val eq_int)
  include Ord_default
end

let ord_int = (module Ord_int : Ord with type t = int)

module Ord_list (O : Ord) = struct
  type t = O.t list

  module E = (val eq_list (module O.E))

  let rec ( <= ) xs ys =
    match xs, ys with
    | [], _ -> true
    | _, [] -> false
    | x :: xs', y :: ys' -> O.( <= ) x y && xs' <= ys'
  ;;

  include Ord_minimal
            (E)
            (struct
              let ( <= ) = ( <= )
            end)
end

let ord_list (type a) (module O : Ord with type t = a) =
  (module Ord_list (O) : Ord with type t = a list)
;;

module Ord_string = struct
  type t = string

  module E = (val eq_string)
  include Ord_default
end

let ord_string = (module Ord_string : Ord with type t = string)
