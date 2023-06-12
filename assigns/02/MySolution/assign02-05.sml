(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-05: 10 points
Please give a NON-RECURSIVE implementation
of isPrime that is based on combinators in
the mysmlib-library for this class.
*)

(* ****** ****** *)

(*
fun
isPrime
(n0: int): bool =
let
fun
loop(i0: int): bool =
if
(i0 * i0 > n0)
then true else
(
if n0 mod i0 = 0
then false else loop(i0+1))
in
  if n0 >= 2 then loop(2) else false
end
*)

(* ****** ****** *)

fun list_tabulate(n: int, f: int -> 'a): 'a list = (* took this from assign02-03.sml for help *)
  let
    fun helper(x: int, y: int): 'a list =
      if x = 0 then []
      else f(y) :: helper(x - 1, y + 1)
  in
    helper(n, 0)
  end

fun isPrime (n0: int): bool =
  let
    list_tabulate(n - 1, fn(x) => x + 2)
  in
    exp
  end

(* end of [CS320-2023-Sum1-assign02-05.sml] *)
