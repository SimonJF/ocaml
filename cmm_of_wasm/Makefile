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
COMPFLAGS=$(INCLUDES) -absname -w +a-4-9-27-41-42-44-45-48 -warn-error A \
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
  -I wasm/text \
  -I wasm/exec \
  -I wasm/runtime \
  -I wasm/script \
  -I wasm/util \
  -I wasm/host \
  -I wasm/binary \
  -I wasm/text \
  -I wasm/main \
  -I wasm/valid \
  -I wasm/syntax \
  -I utils \
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
	../asmcomp/cmm.cmo

all: cmm_of_wasm$(EXE)

wasm/text/parser.mli wasm/text/parser.ml: wasm/text/parser.mly
	$(CAMLYACC) $(YACCFLAGS) $<

partialclean::
	rm -f wasm/text/parser.mli wasm/text/parser.ml wasm/text/parser.output

beforedepend:: wasm/text/parser.mli wasm/text/parser.ml

wasm/text/lexer.ml: wasm/text/lexer.mll
	$(CAMLLEX) $<

partialclean::
	rm -f wasm/text/lexer.ml

beforedepend:: wasm/text/lexer.ml

WASMPARSE=\
	wasm/text/parser.cmi \
	wasm/text/parser.cmo \
	wasm/text/lexer.cmi \
	wasm/text/lexer.cmo

WASMBEFOREPARSE=\
	wasm/main/flags.cmo \
	wasm/util/lib.cmi \
	wasm/util/lib.cmo \
	wasm/util/sexpr.cmi \
	wasm/util/sexpr.cmo \
	wasm/util/source.cmi \
	wasm/util/source.cmo \
	wasm/util/error.cmo \
	wasm/binary/utf8.cmi \
	wasm/binary/utf8.cmo \
	wasm/exec/numeric_error.cmo \
	wasm/exec/int.cmo \
	wasm/exec/float.cmo \
	wasm/exec/i32.cmo \
	wasm/exec/i64.cmo \
	wasm/exec/f64.cmo \
	wasm/exec/f32.cmo \
	wasm/syntax/wasm_types.cmo \
	wasm/syntax/values.cmo \
	wasm/runtime/memory.cmi \
	wasm/runtime/memory.cmo \
	wasm/syntax/ast.cmo \
	wasm/syntax/operators.cmo \
	wasm/exec/i32_convert.cmi \
	wasm/exec/i32_convert.cmo \
	wasm/exec/f32_convert.cmi \
	wasm/exec/f32_convert.cmo \
	wasm/exec/i64_convert.cmi \
	wasm/exec/i64_convert.cmo \
	wasm/exec/f64_convert.cmi \
	wasm/exec/f64_convert.cmo \
	wasm/runtime/func.cmi \
	wasm/runtime/func.cmo \
	wasm/runtime/global.cmi \
	wasm/runtime/global.cmo \
	wasm/runtime/table.cmi \
	wasm/runtime/table.cmo \
	wasm/runtime/instance.cmo \
	wasm/exec/eval_numeric.cmi \
	wasm/exec/eval_numeric.cmo \
	wasm/exec/eval.cmi \
	wasm/exec/eval.cmo \
	wasm/binary/encode.cmi \
	wasm/binary/encode.cmo \
	wasm/script/script.cmo \
	wasm/script/import.cmi \
	wasm/script/import.cmo

WASMAFTERPARSE=\
	wasm/text/parser.cmi \
	wasm/text/parser.cmo \
	wasm/text/lexer.cmi \
	wasm/text/lexer.cmo \
	wasm/text/parse.cmi \
	wasm/text/parse.cmo\
	wasm/binary/decode.cmi \
	wasm/binary/decode.cmo \
	wasm/text/arrange.cmi \
	wasm/text/arrange.cmo \
	wasm/text/print.cmi \
	wasm/text/print.cmo \
	wasm/valid/valid.cmi \
	wasm/valid/valid.cmo \
	wasm/script/run.cmi \
	wasm/script/run.cmo \
	wasm/script/js.cmi \
	wasm/script/js.cmo \
	wasm/host/env.cmo \
	wasm/host/spectest.cmo

#UTILS=\
#	utils/source.cmi \
#	utils/source.cmo \
#	utils/lib.cmo \
#	utils/error.cmo

OBJS=\
	main.cmo


cmm_of_wasm$(EXE): $(WASMBEFOREPARSE) $(WASMPARSE) $(WASMAFTERPARSE) $(OBJS) $(OTHEROBJS)
	$(CAMLC) $(LINKFLAGS) -o cmm_of_wasm$(EXE) -linkall $(OTHEROBJS) $(OBJS)

install:
	$(INSTALL_PROG) cmm_of_wasm$(EXE) "$(INSTALL_BINDIR)/cmm_of_wasm$(EXE)"

clean::
	rm -f cmm_of_wasm$(EXE)
	rm -f wasm/*.cmo wasm/*.cmi
	rm -f utils/*.cmo utils/*.cmi

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
