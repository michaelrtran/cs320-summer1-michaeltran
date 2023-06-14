(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-06-06: midterm1-05: 20 points
*)
(* ****** ****** *)
(*
Magic Triangle:
             1
           1   1
         1   2   1
       1   3   3   1
     1   4   6   4   1
   1   5   10  10  5   1
 1   6   15  20  15  6   1

The magic triangle has the following structure:
- All numbers on the left and right borders are 1.
- All numbers in the interior (non-border) are the sum of the numbers in the row directly above it.

The following example shows how row 6 is computed from row 5.

row 5:      1     4     6     4    1
           / \   / \   / \   / \  / \
row 6:    1   1+4   4+6   6+4  4+1   1


We can represent a magic triangle in SML as an int list list where each row
is stored as a nested int list.

row 0  [[1]
row 1   [1,  1]
row 2   [1,  2,  1]
row 3   [1,  3,  3,  1]
row 4   [1,  4,  6,  4,  1]
row 5   [1,  5,  10, 10, 5,  1]
row 6   [1,  6,  15, 20, 15, 6,  1]]
...


Please implement a function that produces a magic triangle with n row.

triangle 0 = [[1]]
triangle 1 = [[1], [1, 1]]
triangle 2 = [[1], [1, 1], [1, 2, 1]]
triangle 3 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]
triangle 4 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
...
triangle n = ??

Hint: You might want a helper function to compute the current row from
the previous.

*)

(*
fun
magic_triangle (n : int) : int list list = ...
*)

(* ****** ****** *)

(*
val () =
assert320
(
magic_triangle(5) =
[[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1],[1,5,10,10,5,1]])
*)

(* ****** ****** *)

fun current(prev: int list): int list =
  let (* pattern matching function calls *)
    fun middleoflist [] = [] (* when you reach the end of the row (after next case), you must add the empty list to the end to fulfill the recursive call *)
    | middleoflist [x1] = [x1] (* when you are at the last element, simply return the last element *)
    | middleoflist (head :: second :: rest) = (head + second) :: middleoflist(second :: rest) (* recursive call *)
  in
    [1] @ middleoflist(prev) (* @ [1] - commented out to prevent ERROR320 NONE exception *)
  end

fun magic_triangle (n : int) : int list list =
let
  fun make(n: int, previous: int list list): int list list =
    if n = 0 then previous else make(n - 1, previous @ [current(hd(rev previous))])
in
  make(n, [[1]])
end






(* end of [CS320-2023-Sum1-midterm1-magic_triangle.sml] *)
