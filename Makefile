.PHONE: all clean distclean rundemo

all:
	dune build

clean:
	dune clean

distclean:
	git clean -Xdf

rundemo:
	dune build @rundemo --force
