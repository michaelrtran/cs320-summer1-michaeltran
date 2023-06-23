(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
fun
stream_take(fxs, n) = ...
*)

(* ****** ****** *)


fun stream_drop(fxs, n) = fn() => 
    let
      fun helper(xs: 'a stream, x: int): 'a strcon =
        case xs of
            strcon_nil => strcon_nil
        |   strcon_cons(a, b) =>
                if x < n then helper(b, x + 1)
                else strcon_cons(a, fn() => helper(b, x))
    in
      helper(fxs, 0)
    end

(* ****** ****** *)

(* end of [CS320-2023-Spring-stream_takedrop.sml] *)
