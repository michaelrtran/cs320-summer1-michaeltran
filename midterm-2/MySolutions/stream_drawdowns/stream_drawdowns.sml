(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
// A non-empty sequence of numbers forms a
// "drawdown" if every number in the sequence does not
// exceed the first one. A maximal drawdown is one that
// is not contained in any longer drawdowns.
// Please implement a function stream_drawdowns that takes
// a stream fxs of integers and returns a stream consisting
// of all the maximal drawdowns in fxs.
//
*)

(* ****** ****** *)

fun stream_drawdowns (fxs: int stream): int list stream = 
    let
      fun enumerating(integerlist: int list, fxs: int stream): int list stream = fn() =>
        case fxs() of
            strcon_nil => strcon_nil
        |   strcon_cons(a, b) =>
                if integerlist = [] then enumerating([a], b)()
                else if a <= list_head(integerlist) then enumerating([a] :: integerlist, b)()
                else strcon_cons(list_reverse(integerlist), enumerating([a], b))
    in
      enumerating([], fxs)
    end
  
(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm2-stream_drawdowns.sml] *)
