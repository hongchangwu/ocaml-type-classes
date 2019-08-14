open Higher

module type Functor = sig
  type t

  val fmap : ('a -> 'b) -> ('a, t) app -> ('b, t) app
end

module List = Newtype1 (struct
  type 'a t = 'a list
end)

module Option = Newtype1 (struct
  type 'a t = 'a option
end)

module Functor_list = struct
  type t = List.t

  let fmap f xs =
    let rec fmap' = function
      | [] -> []
      | x :: xs -> f x :: fmap' xs
    in
    xs |> List.prj |> fmap' |> List.inj
  ;;
end

let functor_list = (module Functor_list : Functor with type t = List.t)

module Functor_option = struct
  type t = Option.t

  let fmap f o =
    let fmap' = function
      | None -> None
      | Some x -> Some (f x)
    in
    o |> Option.prj |> fmap' |> Option.inj
  ;;
end

let functor_option = (module Functor_option : Functor with type t = Option.t)
