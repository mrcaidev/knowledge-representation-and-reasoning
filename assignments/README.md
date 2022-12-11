# 知识表示与推理作业

## 第一题

### 1.1 travel/2

```prolog
travel(From, To):-
    byCar(From, To);
    byTrain(From, To);
    byPlane(From, To);
    byCar(From, Mid), travel(Mid, To);
    byTrain(From, Mid), travel(Mid, To);
    byPlane(From, Mid), travel(Mid, To).

?- travel(valmont, raglan).
true.

?- travel(raglan, bangkok).
false.
```

### 1.2 travel/3

```prolog
travel(From, To, go(From, To)):-
    byCar(From, To);
    byTrain(From, To);
    byPlane(From, To).

travel(From, To, go(From, Mid, Go)):-
    byCar(From, Mid), travel(Mid, To, Go);
    byTrain(From, Mid), travel(Mid, To, Go);
    byPlane(From, Mid), travel(Mid, To, Go).

?- travel(valmont, paris, go(valmont, metz, go(metz, paris))).
true.

?- travel(valmont, losAngeles, X).
X = go(valmont, saarbruecken, go(saarbruecken, paris, go(paris, losAngeles)));
X = go(valmont, metz, go(metz, paris, go(paris, losAngeles))).
```

## 第二题

### 2.1 combine1/3

```prolog
combine1([], [], []).
combine1([Head1 | Rest1], [Head2 | Rest2], [Head1, Head2 | Result]):-
    combine1(Rest1, Rest2, Result).

?- combine1([a,b,c], [1,2,3], X).
X = [a, 1, b, 2, c, 3].

?- combine1([foo, bar, yip, yup], [glub, glab, glib, glob], Result).
Result = [foo, glub, bar, glab, yip, glib, yup, glob].
```

### 2.2 combine2/3

```prolog
combine2([], [], []).
combine2([Head1 | Rest1], [Head2 | Rest2], [[Head1, Head2] | Result]):-
    combine2(Rest1, Rest2, Result).

?- combine2([a,b,c], [1,2,3], X).
X = [[a, 1], [b, 2], [c, 3]].

?- combine2([foo, bar, yip, yup], [glub, glab, glib, glob], Result).
Result = [[foo, glub], [bar, glab], [yip, glib], [yup, glob]].
```

### 2.3 combine3/3

```prolog
combine3([], [], []).
combine3([Head1 | Rest1], [Head2 | Rest2], [join(Head1, Head2) | Result]):-
    combine3(Rest1, Rest2, Result).

?- combine3([a,b,c], [1,2,3], X).
X = [join(a, 1), join(b, 2), join(c, 3)].

?- combine3([foo, bar, yip, yup], [glub, glab, glib, glob], Result).
Result = [join(foo, glub), join(bar, glab), join(yip, glib), join(yup, glob)].
```

## 第三题

### 3.1 mysubset/2

```prolog
mysubset([], _).
mysubset([Element | Rest], Superset):-
    member(Element, Superset),
    mysubset(Rest, Superset).

?- mysubset([a, c], [a, b, c]).
true.

?- mysubset([a, d], [a, b, c]).
false.
```

### 3.2 mysuperset/2

```prolog
mysuperset(_, []).
mysuperset(Superset, [Element | Rest]):-
    member(Element, Superset),
    mysuperset(Superset, Rest).

?- mysuperset([a, b, c], [a, c]).
true.

?- mysuperset([a, b, c], [a, d]).
false.
```

## 第四题

```prolog
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
L = [[a, 4], [d, 1], [c, 2], [b, 1]].
```

## 第五题

### 5.1 smallest/2

```prolog
smallest(X, tree(X, nil, _)).
smallest(X, tree(_, Left, _)):-
    smallest(X, Left).

?- smallest(X, tree(20, tree(10, nil, nil), tree(40, tree(30, nil, nil), nil))).
X = 10.
```

### 5.2 member/2

```prolog
member(X, tree(X, _, _)).
member(X, tree(_, Left, Right)):-
    member(X, Left);
    member(X, Right).

?- member(X, tree(20, tree(10, nil, nil), tree(40, tree(30, nil, nil), nil))).
X = 20;
X = 10;
X = 40;
X = 30.
```

### 5.3 height/2

```prolog
height(nil, 0).
height(tree(_, Left, Right), H):-
    height(Left, H1),
    height(Right, H2),
    H is max(H1, H2) + 1.

?- height(tree(20, tree(10, nil, nil), tree(40, tree(30, nil, nil), nil)), H).
H = 3.
```
