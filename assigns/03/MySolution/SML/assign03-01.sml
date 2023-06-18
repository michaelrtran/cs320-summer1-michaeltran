(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-12: 20 points
Recall that a reference is precisely an array
of size 1. And it can be treated as a sequence.
For instance, we can define ref_foreach as follows
*)

(* ****** ****** *)

fun
ref_foreach
(r0: 'a ref, work: 'a -> unit): unit = work(!r0)

(* ****** ****** *)

(*
Please implement directly the following combinators
for for references. That is, your implementation should
not make use of any third-order functions defined in the
library for this class.
*)

(* ****** ****** *)


fun ref_get_at (r1: 'a ref, i: int): 'a = !r1

fun ref_forall (r2: 'a ref, test: 'a -> bool): bool = test(!r2)

fun ref_map_list (r3: 'a ref, fopr: ('a) -> 'b): 'b list = [fopr(!r3)]

fun ref_foldleft (r4: 'a ref, res: 'r, fopr: ('r * 'a) -> 'r): 'r = fopr(res, !r4)

fun ref_ifoldleft (r5: 'a ref, res: 'r, fopr: ('r * int * 'a) -> 'r): 'r = fopr(res, 0, !r5)



(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-01.sml] *)
