% facts:-
male(james).
male(daniel).
male(henry).
male(john).
male(albert).
male(andrew).
male(william).
male(oliver).
male(george).
male(thomas).
female(samantha).
female(alice).
female(anna).
female(mary).
female(stephanie).
female(jennifer).
female(jessica).
female(elizabeth).
female(isabella).
female(sofia).
female(nancy).
female(rose).

% Marrage Facts:-
married(james, samantha).
married(william, jennifer).
married(daniel,stephanie).
married(oliver, elizabeth).
married(alice, henry).
married(john, isabella).
married(george, nancy).
married(samantha, james).
married(jennifer, william).
married(stephanie, daniel).
married(elizabeth, oliver).
married(henry, alice).
married(isabella, john).
married(nancy, george).

% Parent Facts:-
parent(james, daniel).
parent(samantha, daniel).
parent(william, stephanie).
parent(jennifer, stephanie).
parent(daniel, henry).
parent(daniel, mary).
parent(daniel, john).
parent(stephanie, henry).
parent(stephanie, mary).
parent(stephanie, john).
parent(oliver, isabella).
parent(oliver, sofia).
parent(oliver, george).
parent(elizabeth, isabella).
parent(elizabeth, sofia).
parent(elizabeth, george).
parent(alice, anna).
parent(henry, anna).
parent(john, albert).
parent(john, andrew).
parent(john, jessica).
parent(isabella, albert).
parent(isabella, andrew).
parent(isabella, jessica).
parent(george, rose).
parent(george, thomas).
parent(nancy, rose).
parent(nancy, thomas).

% Rules:-
mother(X,Y) :-  female(X), parent(X,Y).
father(X,Y) :-  male(X), parent(X,Y).
child(Y,X) :- parent(X, Y).
spouse(X,Y) :- married(X,Y).
husband(X,Y) :- male(X), married(X,Y).
wife(X,Y) :- female(X), married(X,Y).
grandparent(X,Z) :- parent(X,Y), parent(Y,Z).
grandmother(X,Z) :- female(X), grandparent(X,Z).
grandfather(X,Z) :- male(X), grandparent(X,Z).
sibling(X,Y) :- father(Z,X), father(Z,Y), mother(W,X), mother(W,Y), not(X=Y).
son(X,Y) :- male(Y), child(Y,X).
daughter(X,Y) :- female(Y), child(Y,X).
brother(X,Y) :- male(X), sibling(X,Y).
sister(X,Y) :- female(X), sibling(X,Y).
auntoruncle(X,W) :- sibling(X,Y), parent(Y,W).
auntoruncle(X,Z) :- married(X,Y), sibling(Y,W), parent(W,Z).
aunt(X,W) :- female(X), auntoruncle(X,W).
uncle(X,W) :- male(X), auntoruncle(X,W).
cousin(X,Y) :- uncle(Z,X), father(Z,Y).


