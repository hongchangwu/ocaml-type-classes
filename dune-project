(lang dune 1.10)
(using fmt 1.1)

(generate_opam_files true)
(name ocaml-type-classes)
(license MIT)
(maintainers "Hongchang Wu <wuhc85@gmail.com>")
(authors "Hongchang Wu <wuhc85@gmail.com>")
(source (github hongchangwu/ocaml-type-classes))

(package
 (name ocaml-type-classes)
 (depends
  (ocaml (>= 4.02))
  (dune :build)
   ANSITerminal
   higher)
 (synopsis "OCaml Type Classes")
 (description "
 OCaml doesn't have built-in support for type classes,
 but it's possible to emulate them.
 There is more than one way to do it.
 This project shows one way using first-class modules.
 "))
