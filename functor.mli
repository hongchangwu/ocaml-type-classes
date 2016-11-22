open Higher

module type Functor = sig
  type t
  val fmap : ('a -> 'b) -> ('a, t) app -> ('b, t) app
end

module List : Newtype1 with type 'a s = 'a list

module Option : Newtype1 with type 'a s = 'a option

val functor_list : (module Functor with type t = List.t)

val functor_option : (module Functor with type t = Option.t)
