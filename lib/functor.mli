module type S = sig
  type t

  val fmap : ('a -> 'b) -> ('a, t) Higher.app -> ('b, t) Higher.app
end

val list : (module S with type t = Higher_list.t)
val option : (module S with type t = Higher_option.t)
