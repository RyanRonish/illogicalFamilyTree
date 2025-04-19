% You (me) married a widow
husband(me, widow).

% The widow had a grownup daughter (who becomes your stepdaughter)
mother(widow, daughter).

% Your father married that daughter
husband(father, daughter).

% You and the widow had a baby boy
father(me, baby).
mother(widow, baby).

% The daughter and your father had a son
father(father, son).
mother(daughter, son).

% Stepmother: married to father but not the mother
stepmother(X, Y) :- husband(F, X), father(F, Y), not mother(X, Y).

% Grandfather: father of someone’s parent
grandfather(X, Y) :- father(X, Z), (father(Z, Y); mother(Z, Y)).

% Grandchild is reverse of grandfather
grandchild(Y, X) :- grandfather(X, Y).

% Uncle: brother of parent
uncle(X, Y) :- father(Z, Y), father(F, X), father(F, Z), X != Z.
uncle(X, Y) :- mother(Z, Y), father(F, X), father(F, Z), X != Z.

grandpa(X, Y) :- grandfather(X, Y).
