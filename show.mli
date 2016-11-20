module type Show = sig
  type t
  val show : t -> string
end

val show_bool : (module Show with type t = bool)

val show_char : (module Show with type t = char)

val show_float : (module Show with type t = float)

val show_int : (module Show with type t = int)

val show_list :
  (module Show with type t = 'a) ->
  (module Show with type t = 'a list)

val show_string : (module Show with type t = string)
