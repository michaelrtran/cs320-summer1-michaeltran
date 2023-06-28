########################
# HX-2023-06-20: 10 points
########################
"""
Given two words w1 and w2 of the same length,
please implement a function wordle_hint(w1, w2)
that return a sequence of pairs (i, c) for each
character c in w2 where i indicates the color
of c according to the rule of the wordle game:
0: c does not appear in w1 - wrong letter, wrong position
1: c appears in w1 at the same position as it does in w2 - correct letter in correct position
2: c appears in w1 at a different position as it does in w2 - correct letter in wrong position
Please note that the number of times (1, c) or (2, c) appearing
in the returned sequence must be less than or equal to the number
of times c appearing in w1.
For instance,
w1 = water and w2 = water
wordle_hint(w1, w2) =
(1, w), (1, a), (1, t), (1, e), (1, r)
For instance,
w1 = water and w2 = waste
wordle_hint(w1, w2) =
(1, w), (1, a), (0, s), (2, t), (2, e)
For instance,
w1 = abbcc and w2 = bbccd
wordle_hint(w1, w2) =
(2, b), (1, b), (2, c), (1, c), (0, d)
"""
########################################################################
def wordle_hint(w1, w2):
    result = [] # to return in the future - empty sequence
    w1counter = dict() # initializing an empty dictionary to keep track of the occurrences of each character in w1 (correct word)

    for character in w1:
        if character in w1counter: # if the character has alr been found, increment the count
            w1counter[character] += 1

        else:
            w1counter[character] = 1 # else - meaning it is the first time it is found, so set it to 1
    
    for w1_characters, w2_characters in zip(w1, w2): # looking at the characters in both words
        if w1_characters == w2_characters: # if they are equal, decrement to show that the characters are the same in both words
            w1counter[w2_characters] -= 1
            result.append((1, w2_characters)) # append it to the return

        else:
            if w1counter[w2_characters] <= 0:
                result.append((0, w2_characters))

            else:
                result.append((2, w2_characters))
    
    return result # return
########################################################################
