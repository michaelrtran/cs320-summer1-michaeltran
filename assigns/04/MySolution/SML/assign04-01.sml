(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-19: 20 points
Given a list xs, stream_permute_list(xs) returns
a stream of ALL the permutations of xs.
For instance, if xs = [1,2,3], then the returned
stream should enumerate the following 6 lists:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2] and [3,2,1]
//
fun
stream_permute_list(xs: 'a list): 'a list stream = ...
//
*)

fun stream_permute_list(xs: 'a list): 'a list stream =
  let
    fun enumerating(x, []) = 
        [[x]] 
    |   enumerating(x, (y :: ys)) =
            (x :: y :: ys) :: list_map((enumerating(x, ys)), (fn yxs => 
                y :: yxs)
                )

    fun helper([]) = 
        list_streamize[[]]
    |   helper(x :: xs) =
            stream_concat(stream_make_map(helper(xs), (fn y => 
                list_streamize(enumerating(x, y)
                )
                )
                )
                )
  in
    helper(xs)
  end


(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign04-01.sml] *)
