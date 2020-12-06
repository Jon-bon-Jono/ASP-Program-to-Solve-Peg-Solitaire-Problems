%By Jonathan Williams, written November 2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GERMAN BOARD
%the size of this board is variable
board(german).
%choose a size greater than 9x9 that is a multiple of 3
size(9,9).
:- size(X,X), X < 9.
:- size(X,X), X\3!=0.
%choose a starting position
start(5,5).
%omit 4 equal size blocks at each corner
block1(X/3) :- size(X,Y).
block2(X-B1+1) :- size(X,Y), block1(B1).
omitted(1..B1, 1..B1) :- size(X,Y), block1(B1).
omitted(1..B1, B2..Y) :- size(X,Y), block1(B1), block2(B2).
omitted(B2..X, 1..B1) :- size(X,Y), block1(B1), block2(B2).
omitted(B2..X, B2..Y) :- size(X,Y), block1(B1), block2(B2).

num_verts(5*B*B) :- size(X,X), B=X/3.
