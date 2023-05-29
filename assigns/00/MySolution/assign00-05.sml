(* ****** ****** *)

use "./../assign00-lib.sml";

(* ****** ****** *)

fun
stringrev
(cs: string): string = 
let
    fun 
    helper_rec(i0: int): string =
    if i0 < 0 then "" 
    else
    strcat(String.str(strsub(cs, i0)), helper_rec(i0-1))
in
    helper_rec(String.size(cs)-1)
end



(* ****** ****** *)

(* test cases *)
val myans1 = stringrev("12345")
val myans2 = stringrev("98765")
val myans3 = stringrev("abcd")
val myans4 = stringrev("z1")
val myans5 = stringrev("my name is michael")

(* end of [CS320-2023-Spring-assign00-05.sml] *)
