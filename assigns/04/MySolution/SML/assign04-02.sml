(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-06-20: 20 points
Please implement the following function
that enumerates all the pairs (i, j) of natural
numbers satisfying $i <= j$; a pair (i1, j1) must
be enumerated ahead of another pair (i2, j2) if the
following condition holds:
  i1*i1*i1 + j1*j1*j1 < i2*i2*i2 + j2*j2*j2
//
val
theNatPairs_cubesum: (int * int) stream = fn () => ...
//
*)

(* ****** ****** *)

fun tocube(x: int): int =
    x * x * x

val theNatPairs_cubesum: (int * int) stream = 
  let
    fun helper(a: int): (int * int) stream = fn() =>
      strcon_cons((a, a), stream_merge2(stream_tabulate(~1, (fn(b) => 
          (a, a + b + 1))), helper(a + 1), (fn((a1, b1), (a2, b2)) =>
        (tocube(a1) + tocube(b1) <= tocube(a2) + tocube(b2))
        )
        )
        )
  in
    helper(0)
  end

(* end of [CS320-2023-Sum1-assign04-02.sml] *)
