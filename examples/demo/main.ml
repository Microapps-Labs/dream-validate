open Dream_validate
let decode input =
  let source = Source.of_fields [ ("username", input) ] in
  Form.decode source
    (Form.field ~trim:true ~validators:[Validation.length ~min:3 ()] "username")
let () =
  Printf.printf "Typed field decoding from local values, no HTTP server\n";
  List.iter (fun input -> match decode input with
    | Ok username -> Printf.printf "%S -> username=%S\n" input username
    | Error errors -> Printf.printf "%S -> %s\n" input (errors_to_string errors))
    [ "  alice  "; "ab" ]
