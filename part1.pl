/* 
concat(L1, L2, L): meaning the concatenation of two lists L1 and L2 is L.
Examples:
• concat([1, 2, 3], [4], [1, 2, 3, 4]) is true.
• concat([1, [2, 3]], [4], [1, 2, 3, 4]) is false.
• concat([1, [2, 3]], [4], [1, [2, 3], 4]) is true.
You may assume the given arguments are always lists.
https://www.cis.upenn.edu/~matuszek/Concise%20Guides/Concise%20Prolog.html
*/
concat([], L, L).
concat([A | L1], L2, [A | L]) :- concat(L1, L2, L).

/*
element_at(X, N, L): meaning the element X is the Nth element in list L.
Examples:
• element_at(2, 1, [2, 3, 4]) is true.
• element_at(2, 1, [3, 2, 4]) is false.
• element_at(2, 1, [[2], 3, 4]) is false.
• element_at(5, 2, [3, 2, 4]) is false.
https://stackoverflow.com/questions/12939425/prolog-access-specific-member-of-list
*/
element_at(X, N, L) :- element_at(X, 1, N, L).
element_at(X, N, N, [X|_]) :- !.
element_at(X, C, N, [_|L]) :- 
    N > C,
    C1 is C + 1,
    element_at(X, N, C1, L).
    
/*
my_reverse(L1, L2): meaning the reverse of list L1 is L2.
Examples:
• my_reverse([1,2,3], [3,2,1]) is true.
• my_reverse([1,2,3], [2,1,3]) is false.
• my_reverse([1,[2,3],4,[5]], [[5],4,[2,3],1]) is true.
• my_reverse([1,[2,3],4,[5]], [[5],4,[3,2],1]) is false.
• my_reverse([], []) is true.
*/
my_reverse([], []). 
my_reverse(L1, L2) :- reverse_acc(L1, L2, []).
reverse_acc(L, L, []).
reverse_acc([], L, L).
reverse_acc([H|T], L2, L):-  reverse_acc(T, L2, [H|L]).

/*
my_flatten(L1, L2): Given a list L1, its flattened version is L2.
Examples:
• my_flatten([1, 2, 3], [1, 2, 3]) is true.
• my_flatten([1, [2, 3]], [1, 2, 3]) is true.
• my_flatten([1, [2], [3, 4]], [1, 2, 3, 4]) is true.
• my_flatten([1, [2, 3, [4, 5], 6]], [1, 2, 3, 4, 5, 6]) is true.
 Can use append here
*/


/*
compress(L1, L2): Given a list L1, L2 is its compressed version by eliminating the duplicates.
Examples:
• compress([1, 2, 3], [1, 2, 3]) is true.
• compress([1, 2, 2], [1, 2]) is true.
• compress([1, 2, [2]], [1, 2]) is false.
• compress([1, 2, [3, 4], [5], [5], [3]], [1, 2, [3, 4], [5], [3]]) is true.
*/

