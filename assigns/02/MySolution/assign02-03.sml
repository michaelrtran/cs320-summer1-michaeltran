(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-02-10: 10 points
The function list_tabulate takes an integer
[n] and a function [f] and returns a list that
equals [f(0), f(1), ..., f(n-1)]
//
list_tabulate(n: int, f: int -> 'a): 'a list
//
*)

(* ****** ****** *)

fun list_tabulate(n: int, f: int -> 'a): 'a list =
  let
    fun helper(x: int, y: int): 'a list =
      if x = 0 then []
      else f(y) :: helper(x - 1, y + 1)
  in
    helper(n, 0)
  end

(* end of [CS320-2023-Spring-assign03-03.sml] *)
