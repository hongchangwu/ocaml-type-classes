# OCaml Type Classes

## Introduction

OCaml doesn't have built-in support for type classes, but it's possible
to emulate them. There is more than one way to do it. This project
shows one way using first-class modules.

## Quick Start

**Prerequisites**: `dune`, `higher`

To build the project

```
$ dune build
```

To run the demo

```
$ dune build @rundemo
```

## Further Reading
- [ML Modules and Haskell Type Classes: A Constructive Comparison](http://www.cse.unsw.edu.au/~chak/papers/modules-classes.pdf)
- [Lightweight Higher-Kinded Polymorphism](https://ocamllabs.github.io/higher/lightweight-higher-kinded-polymorphism.pdf)
