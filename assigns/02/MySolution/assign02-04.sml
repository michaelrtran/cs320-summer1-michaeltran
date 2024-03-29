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

fun (* copied from the class library and from lecture 06/12, but it did not pass the Gradescope, so putting it in the file for safety *)
list_filter
(xs: 'a list, test: 'a -> bool): 'a list =
list_foldr
( xs, []
, fn(x1, res) => if test(x1) then x1 :: res else res)

fun list_longest_ascend(xs: int list): int list =
  case xs of
    [] => [] (* empty case *)
  | x1 :: xs1 => 
      let
        val list1 = x1 :: list_longest_ascend(list_filter(xs1, fn x => (x >= x1))) (* x1 is in the result, 
        then you can remove all the elements in xs that are less than x1 and then make a recursive call.
        and then x1 :: res1 is the result, where res1 is the return value of the recursive call *)
        val list2 = list_longest_ascend(xs1) (* x1 is not in the result, so simply make a recursive call on xs to get the result *)
      in
        if list_length(list1) >= list_length(list2) then list1 else list2 (* comparing lengths *)
      end
(* end of [CS320-2023-Sum1-assign03-04.sml] *)
