open Eq
open Functor
open Higher
open Num
open Ord
open Show

val elem : (module Eq with type t = 'a) -> 'a -> 'a list -> bool

val fmap : (module Functor with type t = 'f) -> ('a -> 'b) -> ('a, 'f) app -> ('b, 'f) app

val from_int : (module Num with type t = 'a) -> int -> 'a

val maximum : (module Ord with type t = 'a) -> 'a list -> 'a

val minimum : (module Ord with type t = 'a) -> 'a list -> 'a

val print : (module Show with type t = 'a) -> 'a -> unit

val (^) : (module Num with type t = 'a) -> 'a -> int -> 'a
