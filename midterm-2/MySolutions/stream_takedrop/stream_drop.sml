(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)


fun stream_drop(fxs, n) = fn() => 
    let
      fun helper(xs, x) =
        case xs() of
            strcon_nil => strcon_nil
        |   strcon_cons(a, b) => if x < n then helper(b, x + 1) else strcon_cons(a, fn() => helper(b, x))
    in
      helper(fxs, 0)
    end


(* ****** ****** *)

(* end of [CS320-2023-Sum1-stream_drop.sml] *)
