#**************************************************************************
#*                                                                        *
#*                                 OCaml                                  *
#*                                                                        *
#*            Xavier Leroy, projet Cristal, INRIA Rocquencourt            *
#*                                                                        *
#*   Copyright 1999 Institut National de Recherche en Informatique et     *
#*     en Automatique.                                                    *
#*                                                                        *
#*   All rights reserved.  This file is distributed under the terms of    *
#*   the GNU Lesser General Public License version 2.1, with the          *
#*   special exception on linking described in the file LICENSE.          *
#*                                                                        *
#**************************************************************************

include ../config/Makefile
include ../Makefile.common

UNIXDIR=../otherlibs/$(UNIXLIB)
CAMLRUN ?= ../boot/ocamlrun
CAMLYACC ?= ../boot/ocamlyacc

CAMLC=$(CAMLRUN) ../ocamlc -nostdlib -I ../stdlib
COMPFLAGS=$(INCLUDES) -absname -w +a-4-9-41-42-44-45-48 -warn-error A \
          -safe-string -strict-sequence -strict-formats
LINKFLAGS=-linkall -I $(UNIXDIR)
YACCFLAGS=
CAMLLEX=$(CAMLRUN) ../boot/ocamllex
CAMLDEP=$(CAMLRUN) ../tools/ocamldep
DEPFLAGS=$(INCLUDES)

INCLUDES=\
  -I ../asmcomp \
  -I ../utils \
  -I wasm \
  -I $(UNIXDIR)

OTHEROBJS=\
	$(UNIXDIR)/unix.cma \
	../utils/config.cmo ../utils/tbl.cmo ../utils/misc.cmo \
	../utils/identifiable.cmo ../utils/numbers.cmo \
	../utils/arg_helper.cmo ../utils/clflags.cmo \
	../utils/consistbl.cmo ../utils/warnings.cmo \
	../utils/build_path_prefix_map.cmo \
	../utils/terminfo.cmo \
	../parsing/location.cmo ../parsing/longident.cmo ../parsing/docstrings.cmo \
	../parsing/syntaxerr.cmo \
	../parsing/ast_helper.cmo ../parsing/ast_mapper.cmo \
	../parsing/ast_iterator.cmo ../parsing/attr_helper.cmo \
	../parsing/builtin_attributes.cmo \
	../typing/ident.cmo ../typing/path.cmo ../typing/types.cmo \
	../typing/btype.cmo ../typing/primitive.cmo ../typing/typedtree.cmo \
	../typing/subst.cmo ../typing/predef.cmo \
	../typing/datarepr.cmo ../typing/cmi_format.cmo ../typing/env.cmo \
	../typing/oprint.cmo \
	../typing/ctype.cmo ../typing/printtyp.cmo ../typing/mtype.cmo \
	../typing/envaux.cmo \
	../bytecomp/runtimedef.cmo ../bytecomp/bytesections.cmo \
	../bytecomp/dll.cmo ../bytecomp/meta.cmo ../bytecomp/symtable.cmo \
	../bytecomp/opcodes.cmo ../driver/compdynlink.cmo \
	../bytecomp/lambda.cmo \
	../asmcomp/arch.cmo \
	../asmcomp/cmm.cmo \


#OTHEROBJS=\
#  $(UNIXDIR)/unix.cma \
#  ../utils/*.cmo \
#  ../
#  ../utils/config.cmo \
#  ../utils/misc.cmo \
#  ../utils/identifiable.cmo \
#  ../utils/numbers.cmo \
#  ../utils/arg_helper.cmo \
#  ../utils/clflags.cmo \
#  ../utils/consistbl.cmo \
#  ../utils/build_path_prefix_map.cmo \
#  ../parsing/location.cmo \
#  ../parsing/longident.cmo \
#  ../parsing/builtin_attributes.cmo \
#  ../parsing/ast_helper.cmo \
#  ../parsing/ast_mapper.cmo \
#  ../typing/ident.cmo \
#  ../typing/path.cmo \
#  ../typing/btype.cmo \
#  ../typing/datarepr.cmo \
#  ../typing/subst.cmo \
#  ../typing/predef.cmo \
#  ../typing/cmi_format.cmo \
#  ../typing/env.cmo \
#  ../bytecomp/lambda.cmo \
#  ../asmcomp/arch.cmo \
#  ../asmcomp/cmm.cmo

WASM=\
	wasm/numeric_error.cmo \
	wasm/lib.cmo \
	wasm/float.cmo \
	wasm/f32.cmo \
	wasm/f64.cmo \
	wasm/int.cmo \
	wasm/i64.cmo \
    wasm/i32.cmo \
	wasm/utf8.cmo \
	wasm/wasm_types.cmo \
	wasm/values.cmo \
	wasm/ast.cmo


OBJS=\
	main.cmo

all: cmm_of_wasm$(EXE)

cmm_of_wasm$(EXE): $(WASM) $(OBJS) $(OTHEROBJS)
	$(CAMLC) $(LINKFLAGS) -o cmm_of_wasm$(EXE) -linkall $(OTHEROBJS) $(OBJS)

install:
	$(INSTALL_PROG) cmm_of_wasm$(EXE) "$(INSTALL_BINDIR)/cmm_of_wasm$(EXE)"

clean::
	rm -f cmm_of_wasm$(EXE)
	rm -f *.cmo *.cmi

.SUFFIXES:
.SUFFIXES: .ml .cmo .mli .cmi

.ml.cmo:
	$(CAMLC) -c $(COMPFLAGS) $<

.mli.cmi:
	$(CAMLC) -c $(COMPFLAGS) $<

.PHONY: depend
depend:
	$(CAMLDEP) -slash $(DEPFLAGS) *.mli *.ml \
	| sed -e 's,$(UNIXDIR)/,$$(UNIXDIR)/,' > .depend

include .depend
