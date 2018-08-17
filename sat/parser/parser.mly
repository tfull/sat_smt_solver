%{
    open Type
    let parse_error s = raise (ParseError s)
%}

%token <string> VAR
%token AND OR NOT
%token LPAR RPAR
%token EOF

%start parse
%type <Type.logical_tree> parse
%%

parse:
    | o EOF { $1 }
o: 
    | o OR a { Or($1, $3) }
    | a { $1 }
a:
    | a AND n { And($1, $3) }
    | n { $1 }
n:
    | NOT n { Not $2 }
    | atom { $1 }
atom:
    | VAR { Var $1 }
    | LPAR o RPAR { $2 }
;
