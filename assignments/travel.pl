byCar(auckland, hamilton).
byCar(hamilton, raglan).
byCar(valmont, saarbruecken).
byCar(valmont, metz).
byTrain(metz, frankfurt).
byTrain(saarbruecken, frankfurt).
byTrain(metz, paris).
byTrain(saarbruecken, paris).
byPlane(frankfurt, bangkok).
byPlane(frankfurt, singapore).
byPlane(paris, losAngeles).
byPlane(bangkok, auckland).
byPlane(losAngeles, auckland).

travel(From, To):-
    byCar(From, To);
    byTrain(From, To);
    byPlane(From, To);
    byCar(From, Mid), travel(Mid, To);
    byTrain(From, Mid), travel(Mid, To);
    byPlane(From, Mid), travel(Mid, To).

?- travel(valmont, raglan).
?- travel(raglan, bangkok).

travel(From, To, go(From, To)):-
    byCar(From, To);
    byTrain(From, To);
    byPlane(From, To).

travel(From, To, go(From, Mid, Go)):-
    byCar(From, Mid), travel(Mid, To, Go);
    byTrain(From, Mid), travel(Mid, To, Go);
    byPlane(From, Mid), travel(Mid, To, Go).

?- travel(valmont, paris, go(valmont, metz, go(metz, paris))).
?- travel(valmont, losAngeles, X).
