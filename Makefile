all:
	dune build

clean:
	dune clean

distclean:
	git clean -Xdf

run:
	dune exec bin/demo.exe

.PHONY: all clean distclean rundemo
