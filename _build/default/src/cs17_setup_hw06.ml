open! Types

(* HELPERS (do not call) *)

(* take in a string, s, and print it with green color *)
let print_green (s : string) : unit = Printf.printf "\027[32m%s\027[0m\n" s

(* take in a string, s, and print it with red color *)
let print_red (s : string) : unit = Printf.printf "\027[31m%s\027[0m\n" s

(* report 
 * Inputs: actual and expected, two strings, and message, a string 
 * Output: nothing (but prints the test output in the terminal) *)
let report (message : string) (ok : bool) (expected : string) (actual : string)
    : unit =
  if ok then print_green ("ceSuccess: " ^ message)
  else begin
    print_red ("ceFail: " ^ message);
    print_red "expected output: ";
    print_endline expected;
    print_red "actual output: ";
    print_endline actual
  end

let show_sexp sexp_of value = Sexplib0.Sexp.to_string_hum (sexp_of value)

let check_with sexp_of expected actual message =
  report message (expected = actual)
    (show_sexp sexp_of expected)
    (show_sexp sexp_of actual)

let sexp_of_int = Sexplib0.Sexp_conv.sexp_of_int
let sexp_of_float = Sexplib0.Sexp_conv.sexp_of_float
let sexp_of_bool = Sexplib0.Sexp_conv.sexp_of_bool
let sexp_of_string = Sexplib0.Sexp_conv.sexp_of_string
let sexp_of_int_list = Sexplib0.Sexp_conv.sexp_of_list sexp_of_int
let sexp_of_float_list = Sexplib0.Sexp_conv.sexp_of_list sexp_of_float
let sexp_of_bool_list = Sexplib0.Sexp_conv.sexp_of_list sexp_of_bool
let sexp_of_string_list = Sexplib0.Sexp_conv.sexp_of_list sexp_of_string

(* FOR STUDENT USE: check-expects for each type *)

let check_expect_int = check_with sexp_of_int
let check_expect_float = check_with sexp_of_float
let check_bool = check_with sexp_of_bool
let check_string = check_with sexp_of_string
let check_int_list = check_with sexp_of_int_list
let check_float_list = check_with sexp_of_float_list
let check_bool_string = check_with sexp_of_bool_list
let check_string_list = check_with sexp_of_string_list

let check_int_list_list =
  check_with (Sexplib0.Sexp_conv.sexp_of_list sexp_of_int_list)

let check_float_list_list =
  check_with (Sexplib0.Sexp_conv.sexp_of_list sexp_of_float_list)

let check_bool_list_list =
  check_with (Sexplib0.Sexp_conv.sexp_of_list sexp_of_bool_list)

let check_string_list_list =
  check_with (Sexplib0.Sexp_conv.sexp_of_list sexp_of_string_list)

(* let check_expect_rmatrix (expected : rmatrix) (actual : rmatrix)
    (message : string) : unit =
  check_with sexp_of_rmatrix expected actual message *)
