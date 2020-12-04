# ASP-Program-to-Solve-Peg-Solitaire-Problems
ASP Peg Solitaire solving agent with multiple dynamically sized boards.
### Boards:
- english_board.lp
- european_board.lp
- german_board.lp
- pinwheel_board.lp
- simple_3hole_board.lp
- simple_4hole_board.lp
- simple_5hole_board.lp
### Agent:
- peg_solitaire.lp
### Usage: 
> `clingo --models 0 peg_solitare.lp [board_name].lp`
### Example:
> `clingo --models 0 peg_solitare.lp pinwheel_board.lp`

Solving...

Answer: 1

moves(cell(3,2),cell(2,2),cell(1,2),0) moves(cell(2,4),cell(2,3),cell(2,2),1) moves(cell(1,2),cell(2,2),cell(3,2),2) moves(cell(4,3),cell(3,3),cell(2,3),3) moves(cell(2,3),cell(3,3),cell(4,3),5) moves(cell(3,1),cell(3,2),cell(3,3),4)

Answer: 2

moves(cell(3,2),cell(2,2),cell(1,2),0) moves(cell(2,4),cell(2,3),cell(2,2),1) moves(cell(1,2),cell(2,2),cell(3,2),3) moves(cell(4,3),cell(3,3),cell(2,3),2) moves(cell(2,3),cell(3,3),cell(4,3),5) moves(cell(3,1),cell(3,2),cell(3,3),4)

SATISFIABLE

Models       : 2

Calls        : 1

Time         : 0.018s (Solving: 0.01s 1st Model: 0.00s Unsat: 0.00s)

CPU Time     : 0.016s
