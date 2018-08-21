{
    open Type
    open Parser
}

let lower = ['a' - 'z']
let upper = ['A' - 'Z']
let digit = ['0' - '9']
let alpha = (lower | upper)
let var = (lower | upper | digit | '_')

rule tokenize = parse
    | [' ' '\t' '\n'] { tokenize lexbuf }
    | "&&"  { AND }
    | "/\\" { AND }
    | "and" { AND }
    | "||"  { OR }
    | "\\/" { OR }
    | "or"  { OR }
    | "!"   { NOT }
    | "~"   { NOT }
    | "not" { NOT }
    | "("   { LPAR }
    | ")"   { RPAR }
    | alpha var+ as v { VAR v }
    | eof   { EOF }
    | _     { raise (TokenizeError "illegal string") }
