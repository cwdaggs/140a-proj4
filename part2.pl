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

/*
Have to maintain the columns placed and positive diagonals and negative diagonals
Negative diagonal = left to right, top to bottom; row - column remains constant, bounds [-(n-1), n-1]
Positive diagonal = left to right, top to bottom; r+c remains constant, bounds [0, N+2]
*/


% check pos_diag()
% check_column(N, Q, R, C, X, Y, Z) :- 
nonmember(Arg,[Arg|_]) :-
        !,
        fail.
nonmember(Arg,[_|Tail]) :-
        !,
        nonmember(Arg,Tail).
nonmember(_,[]).


% 1 and 1 are row and column counters, first list is for col, 2nd is for pos diag, 3rd is for neg diag
queens(N, Q) :- queens(N, Q, 1, 1, [], [], []).
% Row out of bounds, succesful list
queens(N, Q, R, C, X, Y, Z) :- 
    N1 is N + 1, 
    N1 = R.
% Column out of bounds, move to next row
queens(N, Q, R, C, X, Y, Z) :- 
    C1 is N + 1,
    C1 = C,
    R1 is R + 1,
    queens(N, Q, R1, 1, X, Y, Z).
queens(N, Q, R, C, X, Y, Z) :- 
    Pos is R + C,
    Neg is R - C,
