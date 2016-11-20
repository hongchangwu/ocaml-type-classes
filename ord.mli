open Eq

module type Ord = sig
  type t
  module E : Eq with type t = t
  val (<) : t -> t -> bool
  val (<=) : t -> t -> bool
  val (>=) : t -> t -> bool
  val (>) : t -> t -> bool
  val max : t -> t -> t
  val min : t -> t -> t
end

val ord_bool : (module Ord with type t = bool)

val ord_char : (module Ord with type t = char)

val ord_float : (module Ord with type t = float)

val ord_int : (module Ord with type t = int)

val ord_list :
  (module Ord with type t = 'a) ->
  (module Ord with type t = 'a list)

val ord_string : (module Ord with type t = string)
