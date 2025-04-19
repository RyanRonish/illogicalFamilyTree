%Ryan Ronish
%CS 395 Artificial Intelligence.
%4-19-2025
%Implement the "Grandpa problem" in Clingo.
%Run this command - clingo grandpa.lp - to see the results.

% You the husband are married to a widow.
husband(me, widow).

% The widow has a daughter, since yall are married you're the stepdad.
mother(widow, daughter).

% your dad married you're wifes daughter, so your dad married your stepdaughter.
husband(father, daughter).

% You and the widow had a baby boy.
father(me, baby).
mother(widow, baby).

% The daughter of your wife and your father had a son, which is your grandchild.
father(father, son).
mother(daughter, son).

% Your father is your parent.
father(father, me).

% Recursive fact to complete the loop.
father(baby, me).

% Stepmother is married to the father but is not the biolgical mom to that person.
stepmother(X, Y) :- husband(F, X), father(F, Y), not mother(X, Y).

% Grandfather a person who is the father of someones parent.
grandfather(X, Y) :- father(X, Z), father(Z, Y).
grandfather(X, Y) :- father(X, Z), mother(Z, Y).

% Grandchild is reverse of grandfather.
grandchild(Y, X) :- grandfather(X, Y).

% Uncle, brother of parent, or half brother.
uncle(X, Y) :- father(Z, Y), father(F, X), father(F, Z), X != Z.
uncle(X, Y) :- mother(Z, Y), father(F, X), mother(M, Z), mother(M, X), X != Z.
uncle(X, Y) :- father(Z, Y), father(F, X), mother(M, Z), mother(M, X), X != Z.
uncle(X, Y) :- mother(Z, Y), father(F, X), father(F, Z), X != Z.

% Grandpa alias for grandfather.
grandpa(X, Y) :- grandfather(X, Y).


#show father/2.
#show mother/2.
#show grandfather/2.
#show grandpa/2.

