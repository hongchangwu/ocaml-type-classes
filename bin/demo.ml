open ANSITerminal
open Type_classes
open Prelude

let ( ++ ) = Stdlib.( ^ )

let show () =
  print_string [ cyan; Bold ] "********** Show type class **********\n";
  print_string [ green ] "+ print Show.float 3.14\n";
  print Show.float 3.14;
  print_string [ green ] "+ print (Show.list Show.char) ['a'; 'b'; 'c']\n";
  print (Show.list Show.char) [ 'a'; 'b'; 'c' ];
  print_string
    [ green ]
    "+ print (Show.list (Show.option Show.string)) [Some \"Type Theory\"; None]\n";
  print (Show.list (Show.option Show.string)) [ Some "Type Theory"; None ];
  print_string [ green ] "+ print (Show.list (Show.list Show.int)) [[1; 2]; [3; 4]]\n";
  print (Show.list (Show.list Show.int)) [ [ 1; 2 ]; [ 3; 4 ] ]
;;

let eq () =
  print_string [ cyan; Bold ] "********** Eq type class **********\n";
  print_string [ green ] "+ print Show.char (elem Eq.char 'd' ['a'; 'b'; 'c'])\n";
  print Show.bool (elem Eq.char 'd' [ 'a'; 'b'; 'c' ]);
  print_string
    [ green ]
    "+ print Show.bool (elem (Eq.list Eq.int) [1; 2] [[1; 2]; [3; 4]])\n";
  print Show.bool (elem (Eq.list Eq.int) [ 1; 2 ] [ [ 1; 2 ]; [ 3; 4 ] ])
;;

let ord () =
  print_string [ cyan; Bold ] "********** Ord type class **********\n";
  print_string
    [ green ]
    "+ print Show.bool (let (module O) = Ord.int in let open O in 1 < 2)\n";
  print
    Show.bool
    (let (module O) = Ord.int in
     let open O in
     1 < 2);
  print_string
    [ green ]
    "+ print Show.string (maximum Ord.string [\"OCaml\"; \"Haskell\"; \"Clojure\"])\n";
  print Show.string (maximum Ord.string [ "OCaml"; "Haskell"; "Clojure" ])
;;

let num () =
  print_string [ cyan; Bold ] "********** Num type class **********\n";
  print_string [ green ] "+ print Show.float (from_int Num.float 1)\n";
  print Show.float (from_int Num.float 1);
  print_string [ green ] "+ print Show.float (let (^) = (^) Num.float in 2.5 ^ 3)\n";
  print
    Show.float
    (let ( ^ ) = ( ^ ) Num.float in
     2.5 ^ 3)
;;

let functor_ () =
  print_string [ cyan; Bold ] "********** Functor type class **********\n";
  print_string
    [ green ]
    "+ print (Show.list Show.int) ([1; 2; 3] |> Higher_list.inj |> fmap Functor.list \
     ((+) 1) |> Higher_list.prj)\n";
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
