/*
Given an N ×N chessboard, we want to place N queen on the board so that no two queens can attack
one another. In Chess, a queen can attack another piece vertically, horizontally and diagonally. For more
details, please check https://en.wikipedia.org/wiki/Eight_queens_puzzle. In other words, no two
queens can be placed on the same row, on the same column, or on the same diagnal.
Define a predicate queens(N, Q) where N is the number of rows and columns of the chessboard, and
Q is a list N numbers such that the ith number represents the position of the queen in column i. For
example, Q = [4, 2, 7, 3, 6, 8, 5, 1] means that the queen in the first column is in row 4, the queen in the
second column is in row 2, etc.
Examples:
• It is impossible to place three queens in a 3 ×3 board in such a way.
• Given a 4 ×4 board, there are two ways to place the 4 queens: [2, 4, 1, 3] and [3, 1, 4, 2].
*/

queens_helper([], _).

queens_helper([H|T], N) :-
	queens_helper(T, N), 
	column_backtrack(H, T, 1).

column_backtrack(_, [], _).

column_backtrack(C, [C1|Cs], R) :-
	Diag is abs(C-C1),
	Diag =\= R,
	R1 is R + 1,
	column_backtrack(C, Cs, R1).

queens(N, Q) :-
    length(Q, N),
    numlist(1, N, L),
    % Ensures list of unique elements
    permutation(L, Q),
    queens_helper(Q, N).