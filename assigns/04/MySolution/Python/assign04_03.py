####################################################
#!/usr/bin/env python3
####################################################
"""
HX-2023-06-19: 10 points
You are required to implement the following function
generator_merge2 WITHOUT using streams. A solution that
uses streams is disqualified.
"""
def generator_merge2(gen1, gen2, lte3):
    """
    Given two generators gen1 and gen2 and a comparison
    function lte3, the function generator_merge2 returns
    another generator that merges the elements produced by
    gen1 and gen2 according to the order specified by lte3.
    The function generator_merge2 is expected to work correctly
    for both finite and infinite generators.
    """
    a = next(gen1, None)
    b = next(gen2, None)

    while a is not None or b is not None:
        if a is None:
            while b is not None:
                yield b
                b = next(gen2, None)

        elif lte3(a, b):
            yield a
            a = next(gen1, None)

        elif b is None:
            while a is not None:
                yield a
                a = next(gen1, None)

        else:
            yield b
            b = next(gen2, None)
####################################################
