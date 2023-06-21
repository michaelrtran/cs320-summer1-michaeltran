(* ****** ****** *)

use "./../../../../mysmlib/mysmlib-cls.sml";

(*
HX-2023-05-23:
Library functions
for BUCASCS320-2023-Sum1
This is an individual library,
that is, it is NOT shared by the class.
*)
(* ****** ****** *)

(* end of [BUCASCS320-2023-Sum1-mysmlib-ind.sml] *)

fun copy(xs) =
    case xs of
        nil => nil
    |   x1 :: xs => x1 :: copy(copy(xs))

fun gheep(xs) = (* always returns nil *)
    (* T(n) is O(n) *)
    case xs of
        nil => nil
    |   x1 :: xs => gheep(gheep(xs))

fun alter(xs, ys) =
    case xs of
        nil => ys
    |   x1 :: xs => x1 :: alter(ys, xs)

fun flatten(xs) =
    case xs of
        btree_nil => nil
    |   btree_cons(tl, x0, tr) =>
            flatten(tl) @ [x0] @ flatten(tr)

fun f91(x) = 
    (* McCarthy 91 function *)
    if x > 100 then x - 10 else f91(f91(x + 11))

fun kf91(x: int, k: int -> 'a) =
    (* McCarthy 91 function - tail recursive version *)
    if x > 100 then k(x - 10) else kf91(x + 11, fn res => kf91(res, k)) (* building a new continuation *)

(* 'fun' is a form of syntactic sugar *)
val rec isevn = 
    fn x => if x > 0 then isodd(x - 1) else true
and isodd = 
    fn x => if x > 0 then isevn(x - 1) else false