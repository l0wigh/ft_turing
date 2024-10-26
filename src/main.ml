(* Code juste pour tester le makefile *)

let rec add l =
  match l with
  | [] -> 0
  | h :: t -> h + add t

let () =
  add [1; 2; 3] |> Format.printf "%d\n";
