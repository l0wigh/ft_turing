(* TODO: Uncomment transitions stuff when it's finally used *)

type machine_type = {
  name: string;
  alphabet: string list;
  blank: string;
  states: string list;
  initial: string;
  finals: string list;
  (* transitions: Json_parse.transition; *)
}

let print_machine machine =
  Format.printf "name     : %s\n" machine.name;
  Format.printf "alphabet : %s\n" (Json_parse.create_string_from_array machine.alphabet);
  Format.printf "blank    : %s\n" machine.blank;
  Format.printf "states   : %s\n" (Json_parse.create_string_from_array machine.states);
  Format.printf "initial  : %s\n" machine.initial;
  Format.printf "finals   : %s\n" (Json_parse.create_string_from_array machine.finals)

let turing_error n =
  Format.printf "Error: Bad number of arguments. %d instead of 3.\n" n;
  exit(1)

let () =
  let n = Array.length Sys.argv in
  if n != 3 then turing_error n;

  let json = Yojson.Basic.from_file (Sys.argv.(1)) in
  let open Yojson.Basic.Util in

  let machine = {
    name = member "name" json |> to_string;
    alphabet = member "alphabet" json |> to_list |> filter_string;
    blank = member "blank" json |> to_string;
    states = member "states" json |> to_list |> filter_string;
    initial = member "initial" json |> to_string;
    finals = member "finals" json |> to_list |> filter_string;
    (* transitions = Json_parse.create_transitions json; *)
  } in
  print_machine machine;

