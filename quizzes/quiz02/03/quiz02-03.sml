(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-06-14: 100 points
//
Please implement a function of the name quiz02_03
that takes one list xs of integers and returns a sublist
consisting of every element in xs that is greater than all
the elements after it. For instance, if xs = [3,1,2,1,1],
then the sublist is [3,2,1]; if xs = [5,4,1,2,3], then the
sublist is [5,4,3].
//
*)

(* ****** ****** *)
(*
HX-2023-06-14:
You are not allowed to define recursive functions
to solve this problem. You can use any functions
in mysmlib.sml. If your defines recursive functions,
then it is DISQUALIFIED.
*)
(* ****** ****** *)

(*
val quiz02_03 =
fn(xs: int list) => ...
*)

(* ****** ****** *)

val quiz02_03 = fn(xs: int list) =>
    let
        val helper = fn(xs: int list, empty: int list) => 
            list_foldright(xs, empty, fn(x1, xs1) => (* checks if the list is decreasing *)
                if list_foldright(xs1, true, fn(y1, empty) => (* makes sure that the previous number
                appended to the list is greater than the current one *)
                    x1 > y1 andalso empty) then x1 :: empty
                else empty
            )
    in
      helper(xs, [])
    end

(* end of [CS320-2023-Sum1-quizzes-quiz02-03.sml] *)

