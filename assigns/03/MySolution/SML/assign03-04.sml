(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-24: 10 points
The following is a well-known series:
ln 2 = 1 - 1/2 + 1/3 - 1/4 + ...
Please implement a stream consisting of all the partial
sums of this series.
The 1st item in the stream equals 1
The 2nd item in the stream equals 1 - 1/2
The 3rd item in the stream equals 1 - 1/2 + 1/3
The 4th item in the stream equals 1 - 1/2 + 1/3 - 1/4
And so on, and so forth
//
*)

(* ****** ****** *)


val the_ln2_stream: real stream = (* implementation does not work all the way yet *)
    let
        fun helper(x: int): real =
            let
              val element = if x mod 2 = 0 then ~1.0/ real(x) else 1.0/ real(x)
            in
              strcon_cons(helper(x), helper(x + 1, element + acc))
            end
    in
        fn() => helper(1)
    end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-04.sml] *)
