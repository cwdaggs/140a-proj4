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

% if n = 1, only [1] works, if n =2,3 there are no solutions
% 1 and 1 are row and column counters, first list is for col, 2nd is for pos diag, 3rd is for neg diag
queens(N, Q) :- 
    length(Q, N),
    queens(N, Q, 1, 1, [], [], [], []).
queens(N, Q, Q).
% queens(N, Q, R, C, Q, X, Y, Z).
% Row out of bounds, succesful list
queens(N, Q, R, C, W, X, Y, Z) :- 
    N1 is N + 1, 
    N1 = R, 
    queens(N, Q, W).
% Column out of bounds, move to next row
queens(N, Q, R, C, W, X, Y, Z) :- 
    C1 is N + 1,
    C1 = C,
    R1 is R + 1,
    queens(N, Q, R1, 1, W, X, Y, Z).
% column not in either three arrays so add each calculation to each array
queens(N, Q, R, C, W, X, Y, Z) :- 
    R1 is R + 1,
    Pos is R + C,
    nonmember(Pos, Y),
    Neg is R - C,
    nonmember(Neg, Z),
    nonmember(C, X),
    append(W, [C], W1),
    append(X, [C], X1),
    append(Y, [Pos], Y1),
    append(Z, [Neg], Z1),
    queens(N, Q, R1, 1, W1, X1, Y1, Z1).
    % last(W1, Last),
    % delete(W1, Last, W2),
    % last(X1, Last1),
    % delete(X1, Last1, X2),
    % last(Y1, Last2),
    % delete(Y1, Last2, Y2),
    % last(Z1, Last3),
    % delete(Z1, Last3, Z2).
%column in one of the arrays so go to next column
queens(N, Q, R, C, W, X, Y, Z) :-
    R1 is R - 1,
    C1 is C + 1,
    (memberchk(C, X) ; Pos is R + C, memberchk(Pos, Y) ; Neg is R - C, memberchk(Neg, Z)),
    % last(W, Last),
    % delete(W, Last, W1),
    % last(X, Last1),
    % delete(X, Last1, X1),
    % last(Y, Last2),
    % delete(Y, Last2, Y1),
    % last(Z, Last3),
    % delete(Z, Last3, Z1),
    % queens(N, Q, R, C1, W, X, Y, Z).
    queens(N, Q, R1, C1, W1, X1, Y1, Z1).
%Not working because i say theres a spot where something shouldnt go and then i delete everything and reset again

n_queen(N, Solution) :-
	%create a list of N dummy variabiles
	length(Solution, N),
	
	queen(Solution, N). %search for a configuration of N queens


%returns a list of integer from K to N included es up2N(1,3,X) X = [1,2,3]
up2N(N,N,[N]) :-!.
up2N(K,N,[K|Tail]) :- K < N, K1 is K+1, up2N(K1, N, Tail).


queen([],_). %No queens is a solution for any N queens problem. All queens are in a safe position.

queen([Q|Qlist],N) :-
	
	queen(Qlist, N), %first we solve the subproblem

	%we then generate all possible positions for queen Q
	up2N(1,N,Candidate_positions_for_queenQ),

	%we pick one of such position
	member(Q, Candidate_positions_for_queenQ),

	%we check whether the queen Q is safe
	check_solution(Q,Qlist, 1).



check_solution(_,[], _).

check_solution(Q,[Q1|Qlist],Xdist) :-
	Q =\= Q1, %not on the same row	
	Test is abs(Q1-Q),
	Test =\= Xdist, %diagonal distance
	Xdist1 is Xdist + 1,
	check_solution(Q,Qlist,Xdist1).