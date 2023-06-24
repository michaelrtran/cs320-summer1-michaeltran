(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

fun stream_take(fxs, n) = fn() => 
    let
      fun helper(xs, x): 'a strcon =
        case xs() of
            strcon_nil => strcon_nil
        |   strcon_cons(a, b) => if x >= n then strcon_nil else strcon_cons(a, fn() => helper(b, x + 1))
    in
      helper(fxs, 0)
    end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-stream_take.sml] *)
