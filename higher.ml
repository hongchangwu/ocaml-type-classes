type ('p, 'f) app

module type Newtype1 = sig
  type 'a s
  type t
  external inj : 'a s -> ('a, t) app
    = "%identity"
  external prj : ('a, t) app -> 'a s
    = "%identity"
end

module Newtype1(T : sig type 'a t end) =
struct
  type 'a s = 'a T.t
  type t
  external inj : 'a -> 'b = "%identity"
  external prj : 'a -> 'b = "%identity"
end
