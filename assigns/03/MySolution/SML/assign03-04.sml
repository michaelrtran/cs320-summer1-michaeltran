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

fun helper() =
  let
    fun helper2(denominator: int, previous: real): real strcon = (* recursively adds onto the stream with partial sums *)
      let
        fun result(): real =
          if denominator mod 2 = 0 
          then previous - 1.0 / Real.fromInt(denominator) (* if it is even, subtract *)
          else previous + 1.0 / Real.fromInt(denominator) (* if it is odd, add *)
      in
        strcon_cons(result(), fn() => helper2(denominator + 1, result())) (* increment for the next partial sum *)
      end
  in
    fn() => helper2(1, 0.0) (* create the stream *)
  end


val the_ln2_stream: real stream = helper()


(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-04.sml] *)
