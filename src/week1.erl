-module(week1).

-export([mergesort/1]).

mergesort(L)->
    N = trunc(length(L)/2),
    merge (sort(lists:sublist(L, N)), sort(lists:nthtail(N, L))).

sort([])-> [];
sort([E])-> [E];
sort(L) -> mergesort(L).

merge(L1, []) -> L1;
merge([], L2) -> L2;
merge([H1|T1], [H2|_] = L2) when H1 < H2 -> [H1 | merge(T1, L2)];
merge(L1, [H2|T2]) -> [H2 | merge(L1, T2)].


