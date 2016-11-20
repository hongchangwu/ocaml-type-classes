open Eq
open Ord
open Show

val elem : (module Eq with type t = 'a) -> 'a -> 'a list -> bool

val maximum : (module Ord with type t = 'a) -> 'a list -> 'a

val minimum : (module Ord with type t = 'a) -> 'a list -> 'a

val print : (module Show with type t = 'a) -> 'a -> unit
