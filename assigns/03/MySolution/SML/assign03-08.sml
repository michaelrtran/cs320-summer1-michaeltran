(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-12: 10 points
Please implement the following function
that turns a list of streams into stream of
lists.
//
fun
stream_ziplst('a stream list): 'a list stream
//
If we use a list of streams to represent a
list of rows of a matrix, then the returned
stream consist of lists that are columns of the
matrix.
*)

(* ****** ****** *)

fun stream_ziplst(xs: 'a stream list): 'a list stream =
    let
        fun helper(xs: 'a stream list, x: int) =
            strcon_cons(list_map(xs, fn(y) => stream_get_at(y, x)), fn() => helper(xs, x + 1))
            
            handle ExceptionEndList => strcon_nil
    in
        fn() => helper(xs, 0)
    end

(* end of [CS320-2023-Sum1-assign03-08.sml] *)
