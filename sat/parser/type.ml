type logical_tree = 
    | And of logical_tree * logical_tree
    | Or of logical_tree * logical_tree
    | Not of logical_tree
    | Var of string

exception ParseError of string
exception TokenizeError of string
