(** Higher-kinded polymorphism as described in
    https://ocamllabs.github.io/higher/lightweight-higher-kinded-polymorphism.pdf *)

(** Representation of type application. *)
type ('p, 'f) app

(** Construct a newtype for a type constructor with one parameter. *)
module type Newtype1 = sig
  type 'a s
  type t
  external inj : 'a s -> ('a, t) app
    = "%identity"
  external prj : ('a, t) app -> 'a s
    = "%identity"
end
module Newtype1 (T : sig type 'a t end)
       : Newtype1 with type 'a s = 'a T.t
