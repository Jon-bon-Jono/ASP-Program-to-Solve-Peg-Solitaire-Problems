%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EUROPEAN BOARD
board(european).
%choose either 7x7, 9x9 or 11x11
size(7,7).
%choose a starting position
start(4,4).
%REMOVE CORNERS
corner_depth((N-1)/2) :- size(N,N).
corner_cells(1..D, 1..D) :-  size(N,N), corner_depth(D).
%remove left top corner
D*D {omitted(X,1+Y-X) : corner_cells(X,Y)} D*D :- corner_depth(D), board(european). 
%remove left bottom corner
D*D {omitted(X,D+Y+X) : corner_cells(X,Y)} D*D :- corner_depth(D), board(european). 
%remove right top corner
D*D {omitted(X+D+1,1-Y+X) : corner_cells(X,Y)} D*D :- corner_depth(D), board(european).
%remove right bottom corner 
D*D {omitted(X+D+1,N+Y-X) : corner_cells(X,Y)} D*D :- corner_depth(D), size(N,N), board(european). 
%remove middle edge cells
omitted(D+1,1) :- corner_depth(D), size(N,N).
omitted(D+1,N) :- corner_depth(D), size(N,N).
omitted(N,D+1) :- corner_depth(D), size(N,N).
omitted(1,D+1) :- corner_depth(D), size(N,N).

num_verts(21) :- size(7,7).
num_verts(37) :- size(9,9).
num_verts(58) :- size(11,11).

