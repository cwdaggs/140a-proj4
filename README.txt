Running Test Cases:
Like the professor specified, I used SWI-Prolog to run my programs. To test the
predicates within part1, just run "swipl part1.pl" in the terminal and go
through all the test cases. The same goes for part2. 

Design and Sources:
Concat is quite simple and just keeps removing the head element of the first 
list(L1) and goal list(L) as long as they are equal until L1 is empty.

Element_at and flatten were developed using similar logic (later in queens as well).
They recurse all the way through and produce their results going back. Initially,
element_at failed when I tried putting a variable in for N so I used the professor's
note on a Piazza post in order to fix it (it also only got the first instance of 
a variable rather than all indexes). Flatten had issues at first because I developed
it before knowing I was allowed to use is_list and initially tried using the 
approach I used with reverse and compress. 

Compress and reverse use a more iterative approach by taking or skipping elements
from the initial list and placing them into a third list until the goal list (L2)
and the third list are equivalent. I used the non-member function listed here
(http://eclipseclp.org/doc/bips/lib/lists/nonmember-2.html) since \+member was
not producing the results I wanted. 

As for queens, the methodology described in the initial Wikipedia page provided
gave me a course of action. Since Prolog has built in permutation and numlist 
predicates, these could both be used to go through all combinations for the NxN
boards. This is because they ensure the list of queens contains only unique
numbers from [1,N] such that each column and appropriate row is used once. I also
noticed when looking at the sets of solutions for each N, the total amount of 
solutions for any N is an even number, where half of the solutions are just the 
reverse of the other half, so it technically doesn't matter whether we start from
the back or front of a permutation. This allows each permutation of queens to be
broken into smaller and smaller sublists until the blank list, [], is hit. It 
then proceeds backwards, ensuring there are no diagonal collisions like denoted
in the Wikipedia page, and increases the row using a helper predicate. Boards 
that fail will end up back at the beginning queens predicate and start again 
with another permutation.

I used this source for the math to help check diagonals and altered due to permutation
assurance:
https://stackoverflow.com/questions/3209165/need-help-with-n-queens-program-checking-diagonals/34512651  