let elem (type a) (module E : Eq.S with type t = a) (x : a) =
  let open E in
  List.exists (( == ) x)
;;

let fmap
    (type a b f)
    (module F : Functor.S with type t = f)
    (f : a -> b)
    (xs : (a, f) Higher.app)
  =
  let open F in
  fmap f xs
;;

let from_int (type a) (module N : Num.S with type t = a) =
  let open N in
  from_int
;;

let maximum (type a) (module O : Ord.S with type t = a) = function
  | [] -> failwith "Prelude.maximum: empty list"
  | x :: xs ->
    let open O in
    List.fold_left max x xs
;;

let minimum (type a) (module O : Ord.S with type t = a) = function
  | [] -> failwith "Prelude.minimum: empty list"
  | x :: xs ->
    let open O in
    List.fold_left min x xs
;;

let print (type a) (module S : Show.S with type t = a) (x : a) =
  let open S in
  print_endline @@ show x
;;

let ( ^ ) (type a) (module N : Num.S with type t = a) (x : a) =
  let open N in
  function
  | y when y < 0 -> failwith "Negative exponent"
  | 0 -> from_int 1
  | y ->
    let rec f x = function
      | 1 -> x
      | y when y mod 2 = 0 -> f (x * x) (y / 2)
      | y -> x * f (x * x) (y / 2)
    in
    f x y
;;
