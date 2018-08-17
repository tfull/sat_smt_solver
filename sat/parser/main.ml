open Type

let rec string_of_logical_tree = function
    | And (l1, l2) -> "And (" ^ string_of_logical_tree l1 ^ ", " ^ string_of_logical_tree l2 ^ ")"
    | Or (l1, l2) -> "Or (" ^ string_of_logical_tree l1 ^ ", " ^ string_of_logical_tree l2 ^ ")"
    | Not l -> "Not (" ^ string_of_logical_tree l ^ ")"
    | Var v -> "Var(" ^ v ^ ")"

let _ =
    let tree = Parser.parse Tokenizer.tokenize (Lexing.from_channel stdin) in
    print_string (string_of_logical_tree tree ^ "\n")
