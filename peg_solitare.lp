%By Jonathan Williams, written November 2020
style(simple_3hole).
style(simple_4hole).
style(simple_5hole).
style(pinwheel).
style(european).
style(german).
style(english).

%SOLVE BOARD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
max_moves(N-2) :- num_verts(N).
time_steps(0..T) :- max_moves(T).

%define vertex cells
xdimension(1..X) :- size(X,Y).
ydimension(1..Y) :- size(X,Y).

%define vertexes at time 0
%vertices are cells that are not omitted
vertex(cell(X,Y), 1, 0) :- xdimension(X), ydimension(Y), not omitted(X,Y), not start(X,Y).
vertex(cell(Xs,Ys), 0, 0) :- xdimension(Xs), ydimension(Ys), not omitted(Xs,Ys), start(Xs,Ys).

%DEFINE MOVES
%define all possible moves per timestep -- (X2,Y2) jumps over (X1,Y1) to get to (X0,Y0)
% Right: X2, X1, X0 --> 0, 0, X2
possible_move(cell(X2,Y2),cell(X1,Y1),cell(X0,Y0),T) :- vertex(cell(X2,Y2),1,T),vertex(cell(X1,Y1),1,T), vertex(cell(X0,Y0),0,T), X2+1=X1,X1+1=X0,Y2=Y1,Y1=Y0.

% Left: X0, X1, X2, --> X2, 0, 0
possible_move(cell(X2,Y2),cell(X1,Y1),cell(X0,Y0),T) :- vertex(cell(X2,Y2),1,T),vertex(cell(X1,Y1),1,T), vertex(cell(X0,Y0),0,T), X2-1=X1,X1-1=X0,Y2=Y1,Y1=Y0.

% Up: Y0/Y1/Y2 --> Y2/0/0
possible_move(cell(X2,Y2),cell(X1,Y1),cell(X0,Y0),T) :- vertex(cell(X2,Y2),1,T),vertex(cell(X1,Y1),1,T), vertex(cell(X0,Y0),0,T), Y2-1=Y1,Y1-1=Y0, X2=X1,X1=X0.

% Down: Y2/Y1/Y0 --> 0/0/Y2
possible_move(cell(X2,Y2),cell(X1,Y1),cell(X0,Y0),T) :- vertex(cell(X2,Y2),1,T),vertex(cell(X1,Y1),1,T), vertex(cell(X0,Y0),0,T), Y2+1=Y1,Y1+1=Y0, X2=X1,X1=X0.

%MAKE MOVE
%choose one move per time step from possible moves (don't generate a move on the final time step)
1{moves(cell(X2,Y2),cell(X1,Y1),cell(X0,Y0),T) : possible_move(cell(X2,Y2),cell(X1,Y1),cell(X0,Y0),T)}1 :- time_steps(T), max_moves(M), T<M.

%UPDATE VERTICES EVERY TIMESTEP
%keep vertices the same each time step if they aren't involved in any moves in the prev timestep
vertex(cell(X,Y),O,T+1) :- time_steps(T),vertex(cell(X,Y),O,T), not moves(cell(X,Y),_,_,T),not moves(_,cell(X,Y),_,T), not moves(_,_,cell(X,Y),T).
%update all vertices involved in the move
vertex(cell(X2,Y2),0,T+1) :- moves(cell(X2,Y2),_,_,T).
vertex(cell(X1,Y1),0,T+1) :- moves(_,cell(X1,Y1),_,T).
vertex(cell(X0,Y0),1,T+1) :- moves(_,_,cell(X0,Y0),T).

%count number of occupied vertices on the board at each time step
occupied(N,T) :- time_steps(T), #count {cell(X,Y),T: vertex(cell(X,Y),1,T)} = N.
%TARGET
%have 1 occupied vertex on the final timestep
:- max_moves(T), not occupied(1,T).

#show moves/4.
