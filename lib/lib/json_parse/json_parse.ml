type state = {
  read: string;
  to_state: string;
  write: string;
  action: string;
}

type transition = (string * state list) list

let create_string_from_array lst =
  let rec aux l r =
    match l with
    | [] -> r
    | h :: t when (r = "") -> aux t (r ^ h)
    | h :: t -> aux t (r ^ ", " ^ h)
  in
  "[" ^ aux lst "" ^ "]"

let create_state json =
 let open Yojson.Basic.Util in
  {
    read = member "read" json |> to_string;
    to_state = member "to_state" json |> to_string;
    write = member "write" json |> to_string;
    action = member "action" json |> to_string;
  }

let create_transitions json =
  let open Yojson.Basic.Util in 
  member "transitions" json
  |> to_assoc
  |> List.map (fun (state, transitions_json) ->
        let transitions = transitions_json
        |> to_list
        |> List.map create_state in
        (state, transitions))

