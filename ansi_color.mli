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

val foreground : color -> weight -> string

val background : color -> weight -> string

val reset : string
