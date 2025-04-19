%Ryan Ronish
%CS 395 Artificial Intelligence
%4-19-2025
%Implement the "Grandpa problem" in Clingo

% You (me) married a widow
husband(me, widow).

% The widow had a grownup daughter (who becomes your stepdaughter)
mother(widow, daughter).

% Your father married that daughter (your stepdaughter)
husband(father, daughter).

% You and the widow had a baby boy
father(me, baby).
mother(widow, baby).

% The daughter (your stepmother) and your father had a son
father(father, son).
mother(daughter, son).

% Your father is your parent
father(father, me).

% Recursive fact to complete the loop
father(baby, me).

% Stepmother: married to father but not the mother
stepmother(X, Y) :- husband(F, X), father(F, Y), not mother(X, Y).

% Grandfather: father of someone’s parent
grandfather(X, Y) :- father(X, Z), father(Z, Y).
grandfather(X, Y) :- father(X, Z), mother(Z, Y).

% Grandchild is reverse of grandfather
grandchild(Y, X) :- grandfather(X, Y).

% Uncle: brother of parent
uncle(X, Y) :- father(Z, Y), father(F, X), father(F, Z), X != Z.
uncle(X, Y) :- mother(Z, Y), father(F, X), father(F, Z), X != Z.

% Grandpa alias for grandfather
grandpa(X, Y) :- grandfather(X, Y).

% Constraint to prevent self relationships
:- grandfather(X, X), X != me.

#show father/2.
#show mother/2.
#show grandfather/2.
#show grandpa/2.