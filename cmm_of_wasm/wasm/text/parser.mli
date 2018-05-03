type token =
  | NAT of (string)
  | INT of (string)
  | FLOAT of (string)
  | STRING of (string)
  | VAR of (string)
  | VALUE_TYPE of (Wasm_types.value_type)
  | ANYFUNC
  | MUT
  | LPAR
  | RPAR
  | NOP
  | DROP
  | BLOCK
  | END
  | IF
  | THEN
  | ELSE
  | SELECT
  | LOOP
  | BR
  | BR_IF
  | BR_TABLE
  | CALL
  | CALL_INDIRECT
  | RETURN
  | GET_LOCAL
  | SET_LOCAL
  | TEE_LOCAL
  | GET_GLOBAL
  | SET_GLOBAL
  | LOAD of (int option -> Memory.offset -> Ast.instr')
  | STORE of (int option -> Memory.offset -> Ast.instr')
  | OFFSET_EQ_NAT of (string)
  | ALIGN_EQ_NAT of (string)
  | CONST of (string Source.phrase -> Ast.instr' * Values.value)
  | UNARY of (Ast.instr')
  | BINARY of (Ast.instr')
  | TEST of (Ast.instr')
  | COMPARE of (Ast.instr')
  | CONVERT of (Ast.instr')
  | UNREACHABLE
  | CURRENT_MEMORY
  | GROW_MEMORY
  | FUNC
  | START
  | TYPE
  | PARAM
  | RESULT
  | LOCAL
  | GLOBAL
  | TABLE
  | ELEM
  | MEMORY
  | DATA
  | OFFSET
  | IMPORT
  | EXPORT
  | MODULE
  | BIN
  | QUOTE
  | SCRIPT
  | REGISTER
  | INVOKE
  | GET
  | ASSERT_MALFORMED
  | ASSERT_INVALID
  | ASSERT_SOFT_INVALID
  | ASSERT_UNLINKABLE
  | ASSERT_RETURN
  | ASSERT_RETURN_CANONICAL_NAN
  | ASSERT_RETURN_ARITHMETIC_NAN
  | ASSERT_TRAP
  | ASSERT_EXHAUSTION
  | INPUT
  | OUTPUT
  | EOF

val script :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Script.script
val script1 :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Script.script
val module1 :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Script.var option * Script.definition
