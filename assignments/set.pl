mysubset([], _).
mysubset([Element | Rest], Superset):-
    member(Element, Superset),
    mysubset(Rest, Superset).

?- mysubset([a, c], [a, b, c]).
?- mysubset([a, d], [a, b, c]).

mysuperset(_, []).
mysuperset(Superset, [Element | Rest]):-
    member(Element, Superset),
    mysuperset(Superset, Rest).

?- mysuperset([a, b, c], [a, c]).
?- mysuperset([a, b, c], [a, d]).
