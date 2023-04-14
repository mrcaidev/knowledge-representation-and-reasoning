combine1([], [], []).
combine1([Head1 | Rest1], [Head2 | Rest2], [Head1, Head2 | Result]):-
    combine1(Rest1, Rest2, Result).

?- combine1([a,b,c], [1,2,3], X).
?- combine1([foo, bar, yip, yup], [glub, glab, glib, glob], Result).

combine2([], [], []).
combine2([Head1 | Rest1], [Head2 | Rest2], [[Head1, Head2] | Result]):-
    combine2(Rest1, Rest2, Result).

?- combine2([a,b,c], [1,2,3], X).
?- combine2([foo, bar, yip, yup], [glub, glab, glib, glob], Result).

combine3([], [], []).
combine3([Head1 | Rest1], [Head2 | Rest2], [join(Head1, Head2) | Result]):-
    combine3(Rest1, Rest2, Result).

?- combine3([a,b,c], [1,2,3], X).
?- combine3([foo, bar, yip, yup], [glub, glab, glib, glob], Result).
