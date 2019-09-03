all:
	dune build

clean:
	dune clean

distclean:
	git clean -Xdf

rundemo:
	dune exec ./demo.exe

.PHONY: all clean distclean rundemo
