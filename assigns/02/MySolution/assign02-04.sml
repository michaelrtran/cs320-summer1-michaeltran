(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that finds
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.

fun list_longest_ascend(xs: int list): int list
*)

(* ****** ****** *)

fun list_longest_ascend(xs: int list): int list =
  case xs of
    [] => []
  | x1 :: xs1 =>
      let
        val list1 = x1 :: list_longest_ascend(list_filter(xs1, fn x => (x >= x1)))
        val list2 = list_longest_ascend(xs1)
      in
        if list_length(list1) >= list_length(list2) then list1 else list2
      end
(* end of [CS320-2023-Sum1-assign03-04.sml] *)
