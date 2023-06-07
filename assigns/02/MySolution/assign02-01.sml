(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-02-09: 10 points
//
The function find_root(f0)
finds the first root of [f0] in
the following sequence:
0, 1, -1, 2, -2, 3, -3, 4, -4, ...
*)
(*
fun
find_root(f0: int -> int): int = ...
*)

(* ****** ****** *)

fun
find_root(f0: int -> int): int =
    let
      fun helper(a: int): int = (* hardcoding the sequence into the code *)
        if f0(a) = 0 then a (* checks if the val equals 0 *)
        else if a = 0 then helper(a + 1) (* if it does not work, increment the next number by 1 -i.e. start at 0, then go to 1 *)
        else if a > 0 then helper(a * ~1) (* if you are at 1, the next number is -1, so negate the number *)
        else helper(a * ~1 + 1) (* if you are at -1, negate and increment by 1 to get to 2 *)
    in
      helper(0)
    end


(* end of [CS320-2023-Sum1-assign02-01.sml] *)
