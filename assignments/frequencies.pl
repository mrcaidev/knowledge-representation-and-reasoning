frequencies([], []).
frequencies([Item | RestItems], Rest):-
    frequencies(RestItems, L1),
    add(Item, L1, Rest).

add(Item, [], [[Item, 1]]).
add(Item, [[IterItem, IterCount] | RestRecords], [[IterItem, Count] | RestRecords]):-
    Item = IterItem,
    Count is IterCount + 1.
add(Item, [[IterItem, IterCount] | RestRecords], [[IterItem, IterCount] | CandidateRecords]):-
    Item \= IterItem,
    add(Item, RestRecords, CandidateRecords).

?- frequencies([a, b, a, c, a, c, d, a], L).
