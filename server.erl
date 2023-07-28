-module(server).
-export([start/2 , loop/2]).
%quicksort(_ , []) -> []; quicksort/2 
%quicksort(P, [Pivot | T]) -> quicksort(P , [X || X <- T , P(X, Pivot)]) ++ [Pivot] ++  quicksort(P , [X || X <- T , not P(X, Pivot)]).


start(N,A) -> spawn (server, loop, [N,A]).
loop(0,A) -> io:format("~p(~p) ~p~n", [A, self(), stops]);
loop(N,A) -> io:format("~p(~p) ~p~n", [A, self(), N]), loop(N-1,A).