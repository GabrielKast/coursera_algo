-module(week1).

-export([mergesort/1]).
-export([inversion/1]).

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

%% inversion({L, N})->
%%     Len = trunc(length(L)/2),
%%     S1 = sort2({lists:sublist(L, Len), N}),
%%     S2 = sort2({lists:nthtail(Len, L), N}),
%%     merge_and_count(S1, S2);
%% inversion(L)-> inversion({L, 0}).

%% sort2({[], N})-> {[], N};
%% sort2({[E], N})-> {[E], N};
%% sort2({L, N}) -> inversion({L, N}).


inversion(L)->
    Len = trunc(length(L)/2),
    merge_and_count(sort1(lists:sublist(L, Len)), sort1(lists:nthtail(Len, L))).

sort1([])-> {[], 0};
sort1([E])-> {[E], 0};
sort1(L) -> inversion(L).

merge_and_count({L1, N1}, {L2, N2})-> merge_and_count(L1, L2, [], N1 + N2).
merge_and_count(L1, [], L, N) -> {L ++ L1, N};
merge_and_count([], L2, L, N) -> {L ++ L2, N};
merge_and_count([H1|T1], [H2|_] = L2, L, N) when H1 < H2 -> 
    merge_and_count(T1, L2, L++[H1], N);
merge_and_count(L1, [H2|T2], L, N) -> 
    merge_and_count(L1, T2, L++[H2], N + length(L1)).
