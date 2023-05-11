open Bimage
open Bimage_unix
open Stdio

let _write_bytes_to_file (file_path : string) (bytes : Bytes.t) : unit =
  Out_channel.with_file file_path ~f:(fun channel ->
      Out_channel.output_string channel @@ Bytes.to_string bytes)

let read_channel_to_bytes (channel : In_channel.t) : Bytes.t option =
  let size = Int64.to_int @@ In_channel.length channel in
  let buf = Bytes.create size in
  match In_channel.really_input channel ~buf ~pos:0 ~len:size with
  | Some () -> Some buf
  | None -> None

let read_file_to_bytes (file_path : string) : Bytes.t option =
  In_channel.with_file file_path ~f:read_channel_to_bytes

let _ =
  let bytes =
    match read_file_to_bytes "ocaml-logo.png" with
    | Some bytes -> bytes
    | None -> Bytes.empty
  in
  match Stb.read_u8_from_memory rgba bytes with
  | Ok _ -> print_endline "Ok"
  | Error err -> print_endline @@ Error.to_string err

(* let _ = *)
(*   match Stb.read_u8 rgba "ocaml-logo.png" with *)
(*   | Ok _ -> print_endline "ok" *)
(*   | Error err -> print_endline @@ Error.to_string err *)
