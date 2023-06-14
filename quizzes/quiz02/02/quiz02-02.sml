(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-06-14: 60 points
//
Please implement a function of the name quiz02_02
that takes two lists xs and ys of integers and checks
whether there exists a pair (x, y) such that |x-y| < 10
where x is in xs and y is in ys.
//
*)

(* ****** ****** *)

val
abs =
fn(x:int) =>
if x >= 0 then x else ~x

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
val
quiz02_02 =
fn(xs: int list, ys: int list) => ...
*)

(* ****** ****** *)

val quiz02_02 = fn(xs: int list, ys: int list) =>
    let
      val helper = fn(tuple) =>
        let
          val x1 = #1(tuple) (* get the first number in the tuple *)
          val y1 = #2(tuple) (* get the second number in the tuple *)
        in
          abs (x1 - y1) < 10 (* check if absolute value works *)
        end
    in
      list_exists(list_cross2(xs, ys), helper) (* if one pair exists, then return true *)
    end

(* end of [CS320-2023-Sum1-quizzes-quiz02-02.sml] *)

