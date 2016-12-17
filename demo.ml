open Ansi_color
open Eq
open Functor
open Num
open Ord
open Prelude
open Show

let (++) = Pervasives.(^)

let show () =
  print_endline @@ (foreground Cyan Bold) ++ "********** Show type class **********" ++ reset;
  print_endline "+ print show_float 3.14";
  print show_float 3.14;
  print_endline "+ print (show_list show_char) ['a'; 'b'; 'c']";
  print (show_list show_char) ['a'; 'b'; 'c'];
  print_endline "+ print (show_list (show_list show_int)) [[1; 2]; [3; 4]]";
  print (show_list (show_list show_int)) [[1; 2]; [3; 4]]

let eq () =
  print_endline @@ (foreground Cyan Bold) ++ "********** Eq type class **********" ++ reset;
  print_endline "+ print show_char (elem eq_char 'd' ['a'; 'b'; 'c'])";
  print show_bool (elem eq_char 'd' ['a'; 'b'; 'c']);
  print_endline "+ print show_bool (elem (eq_list eq_int) [1; 2] [[1; 2]; [3; 4]])";
  print show_bool (elem (eq_list eq_int) [1; 2] [[1; 2]; [3; 4]])

let ord () =
  print_endline @@ (foreground Cyan Bold) ++ "********** Ord type class **********" ++ reset;
  print_endline "+ print show_bool (let (module O) = ord_int in let open O in 1 < 2)";
  print show_bool (let (module O) = ord_int in let open O in 1 < 2);
  print_endline "+ print show_string (maximum ord_string [\"OCaml\"; \"Haskell\"; \"Clojure\"])";
  print show_string (maximum ord_string ["OCaml"; "Haskell"; "Clojure"])

let num () =
  print_endline @@ (foreground Cyan Bold) ++ "********** Num type class **********" ++ reset;
  print_endline "+ print show_float (from_int num_float 1)";
  print show_float (from_int num_float 1);
  print_endline "+ print show_float (let (^) = (^) num_float in 2.5 ^ 3)";
  print show_float (let (^) = (^) num_float in 2.5 ^ 3)

let functor_ () =
  print_endline @@ (foreground Cyan Bold) ++ "********** Functor type class **********" ++ reset;
  print_endline "+ print (show_list show_int) ([1; 2; 3] |> List.inj |> fmap functor_list ((+) 1) |> List.prj)";
  print (show_list show_int) ([1; 2; 3] |> List.inj |> fmap functor_list ((+) 1) |> List.prj)

let () =
  show ();
  eq ();
  ord ();
  num ();
  functor_ ()
