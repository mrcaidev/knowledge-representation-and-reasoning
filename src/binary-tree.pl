smallest(X, tree(X, nil, _)).
smallest(X, tree(_, Left, _)):-
    smallest(X, Left).

contain(X, tree(X, _, _)).
contain(X, tree(_, Left, Right)):-
    contain(X, Left);
    contain(X, Right).

height(nil, 0).
height(tree(_, Left, Right), H):-
    height(Left, H1),
    height(Right, H2),
    H is max(H1, H2) + 1.


?- smallest(X, tree(20, tree(10, nil, nil), tree(40, tree(30, nil, nil), nil))).
?- contain(X, tree(20, tree(10, nil, nil), tree(40, tree(30, nil, nil), nil))).
?- height(tree(20, tree(10, nil, nil), tree(40, tree(30, nil, nil), nil)), H).
