open Higher

module type S = sig
  type t

  val fmap : ('a -> 'b) -> ('a, t) app -> ('b, t) app
end

module List = struct
  type t = Higher_list.t

  let fmap f xs =
    let rec fmap' = function
      | [] -> []
      | x :: xs -> f x :: fmap' xs
    in
    xs |> Higher_list.prj |> fmap' |> Higher_list.inj
  ;;
end

let list = (module List : S with type t = List.t)

module Option = struct
  type t = Higher_option.t

  let fmap f o =
    let fmap' = function
      | None -> None
      | Some x -> Some (f x)
    in
    o |> Higher_option.prj |> fmap' |> Higher_option.inj
  ;;
end

let option = (module Option : S with type t = Option.t)
