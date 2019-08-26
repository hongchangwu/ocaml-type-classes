open Ansi_color
open Prelude

let ( ++ ) = Pervasives.( ^ )

let show () =
  print_endline
  @@ (foreground Cyan Bold ++ "********** Show type class **********" ++ reset);
  print_endline "+ print Show.float 3.14";
  print Show.float 3.14;
  print_endline "+ print (Show.list Show.char) ['a'; 'b'; 'c']";
  print (Show.list Show.char) [ 'a'; 'b'; 'c' ];
  print_endline "+ print (Show.list (Show.list Show.int)) [[1; 2]; [3; 4]]";
  print (Show.list (Show.list Show.int)) [ [ 1; 2 ]; [ 3; 4 ] ]
;;

let eq () =
  print_endline
  @@ (foreground Cyan Bold ++ "********** Eq type class **********" ++ reset);
  print_endline "+ print Show.char (elem Eq.char 'd' ['a'; 'b'; 'c'])";
  print Show.bool (elem Eq.char 'd' [ 'a'; 'b'; 'c' ]);
  print_endline "+ print Show.bool (elem (Eq.list Eq.int) [1; 2] [[1; 2]; [3; 4]])";
  print Show.bool (elem (Eq.list Eq.int) [ 1; 2 ] [ [ 1; 2 ]; [ 3; 4 ] ])
;;

let ord () =
  print_endline
  @@ (foreground Cyan Bold ++ "********** Ord type class **********" ++ reset);
  print_endline "+ print Show.bool (let (module O) = Ord.int in let open O in 1 < 2)";
  print
    Show.bool
    (let (module O) = Ord.int in
     let open O in
     1 < 2);
  print_endline
    "+ print Show.string (maximum Ord.string [\"OCaml\"; \"Haskell\"; \"Clojure\"])";
  print Show.string (maximum Ord.string [ "OCaml"; "Haskell"; "Clojure" ])
;;

let num () =
  print_endline
  @@ (foreground Cyan Bold ++ "********** Num type class **********" ++ reset);
  print_endline "+ print Show.float (from_int Num.float 1)";
  print Show.float (from_int Num.float 1);
  print_endline "+ print Show.float (let (^) = (^) Num.float in 2.5 ^ 3)";
  print
    Show.float
    (let ( ^ ) = ( ^ ) Num.float in
     2.5 ^ 3)
;;

let functor_ () =
  print_endline
  @@ (foreground Cyan Bold ++ "********** Functor type class **********" ++ reset);
  print_endline
    "+ print (Show.list Show.int) ([1; 2; 3] |> Higher_list.inj |> fmap Functor.list \
     ((+) 1) |> Higher_list.prj)";
  print
    (Show.list Show.int)
    ([ 1; 2; 3 ] |> Higher_list.inj |> fmap Functor.list (( + ) 1) |> Higher_list.prj)
;;

let () =
  show ();
  eq ();
  ord ();
  num ();
  functor_ ()
;;
