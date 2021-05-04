and(A,B) :- A, B.

or(A,_) :- A.
or(_,B) :- B.

nxor(A,B):- or(and(A,B),and( \+ (A), \+ (B))).

xor(A,B):- \+ (nxor(A,B)).

nor(A,B):- \+ (or(A,B)).

nand(A,B):- \+ (and(A,B)).

implies(A,B):- or( \+ (A),B).
not(A):- \+(A).

% bind(x) :-instatiate X to be true and false successively

bind(true).
bind(fail).

:- op(900,fy,not).
:- op(910,yfx,and).
:- op(910,yfx,nand).
:- op(920,yfx,or).
:- op(920,yfx,nor).
:- op(930,yfx,implies).
:- op(930,yfx,nxor).
:- op(930,yfx,xor).



table(VarList,Expr) :- bindList(VarList), do(VarList,Expr),fail.

bindList([]).
bindList([V|Vs]):- bind(V),bindList(Vs).

do(VarList,Expr):- writeVarList(VarList),writeExpr(Expr),nl.

writeVarList([]).
writeVarList([V|Vs]):- write(V),write(' '),writeVarList(Vs).

writeExpr(Expr):- Expr,!,write(true).
writeExpr(_):-write(fail).
