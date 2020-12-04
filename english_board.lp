%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ENGLISH BOARD
board(english).
%Size-1 must be divisible by 3
size(7,7).
:- size(X,X), X < 7.
:- size(X,X), (X-1)\3!=0.
%choose starting position
start(4,4).
%omit blocks in the corner
block1((X-1)/3) :- size(X,Y).
%blocks are size block1 x block1
omitted(1..B1, 1..B1) :- size(X,Y), block1(B1).
omitted(1..B1, (Y-B1+1)..Y) :- size(X,Y), block1(B1).
omitted((X-B1+1)..X, 1..B1) :- size(X,Y), block1(B1).
omitted((X-B1+1)..X, (Y-B1+1)..Y) :- size(X,Y), block1(B1).

num_verts(2*B1*B2 + X*B2) :- size(X,Y), block1(B1), B2 = X-2*B1.