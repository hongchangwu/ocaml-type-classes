open Eq
open Ord
open Show

let elem (type a)
         (module E : Eq with type t = a)
         (x : a) =
  let open E in
  List.exists ((==) x)

let maximum (type a)
            (module O : Ord with type t = a)
  = function
  | [] -> failwith "Prelude.maximum: empty list"
  | x :: xs ->
     let open O in
     List.fold_left max x xs

let minimum (type a)
            (module O : Ord with type t = a)
  = function
  | [] -> failwith "Prelude.minimum: empty list"
  | x :: xs ->
     let open O in
     List.fold_left min x xs

let print (type a)
          (module S : Show with type t = a)
          (x : a) =
  let open S in
  print_endline @@ show x
