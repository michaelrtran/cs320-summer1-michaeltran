(* ****** ****** *)
use "./../../assign01-lib.sml";
(* ****** ****** *)
use "./../../MySolution/SML/assign01-01.sml";
(* ****** ****** *)

(*
//
Assign01-02: 10 points
//
Please implement a function
that does subscripting on xlist DIRECTLY:
//
fun xlist_sub(xs: 'a xlist, i0: int): 'a
//
If 'i0' is an illegal index, then xlist_sub
should raise the XlistSubscript exception.
//
You should NOT convert xlist into list and
then do subscripting.
//
*)

(* ****** ****** *)

fun
xlist_sub
(xs: 'a xlist, i0: int): 'a = 
    case xs of
        xlist_nil => raise XlistSubscript
    |   xlist_cons(x1, xs) =>
            if i0 = 0 then x1 
            else if i0 > xlist_size(xs) then raise XlistSubscript
            else xlist_sub(xs, i0 - 1)
    |   xlist_snoc(xs, x1) =>
            if i0 = xlist_size(xs) then x1 
            else if i0 > xlist_size(xs) then raise XlistSubscript
            else xlist_sub(xs, i0)
    |   xlist_append(xs, ys) =>
            if i0 < xlist_size(xs) then xlist_sub(xs, i0) 
            else if i0 > xlist_size(xs) + xlist_size(ys) then raise XlistSubscript
            else xlist_sub(ys, i0 - xlist_size(xs))
    |   xlist_reverse(xs) =>
            if i0 > xlist_size(xs) then raise XlistSubscript
            else xlist_sub(xs, xlist_size(xs) - 1 - i0)




(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-02.sml] *)
