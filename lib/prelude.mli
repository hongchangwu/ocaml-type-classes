val elem : (module Eq.S with type t = 'a) -> 'a -> 'a list -> bool

val fmap
  :  (module Functor.S with type t = 'f)
  -> ('a -> 'b)
  -> ('a, 'f) Higher.app
  -> ('b, 'f) Higher.app

val from_int : (module Num.S with type t = 'a) -> int -> 'a
val maximum : (module Ord.S with type t = 'a) -> 'a list -> 'a
val minimum : (module Ord.S with type t = 'a) -> 'a list -> 'a
val print : (module Show.S with type t = 'a) -> 'a -> unit
val ( ^ ) : (module Num.S with type t = 'a) -> 'a -> int -> 'a
