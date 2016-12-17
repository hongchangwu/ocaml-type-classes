type color =
  | Black
  | Red
  | Green
  | Yellow
  | Blue
  | Magenta
  | Cyan
  | White

type weight =
  | Normal
  | Bold

let esc = "\027"

let color_code color weight =
  let color_code =
    match color with
    | Black -> "0"
    | Red -> "1"
    | Green -> "2"
    | Yellow -> "3"
    | Blue -> "4"
    | Magenta -> "5"
    | Cyan -> "6"
    | White -> "7"
  in
  let weight_code =
    match weight with
    | Normal -> "m"
    | Bold -> ";1m"
  in
  color_code ^ weight_code

let foreground color weight =
  esc ^ "[3" ^ color_code color weight

let background color weight =
  esc ^ "[4" ^ color_code color weight

let reset = esc ^ "[0m"
