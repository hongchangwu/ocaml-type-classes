module type Eq = sig
  type t
  val (==): t -> t -> bool
  val (/=) : t -> t -> bool
end

val eq_bool : (module Eq with type t = bool)

val eq_char : (module Eq with type t = char)

val eq_float : (module Eq with type t = float)

val eq_int : (module Eq with type t = int)

val eq_list :
  (module Eq with type t = 'a) ->
  (module Eq with type t = 'a list)

val eq_string : (module Eq with type t = string)
