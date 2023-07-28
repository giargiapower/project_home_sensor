-module(converter).
-export([converter/0]).

converter() ->
    receive
        {celsius, Temp} ->
            io:format("Celsius: ~p~n", [Temp]),
            converter();
        {fahrenheit, Temp} ->
            io:format("Fahrenheit: ~p~n", [Temp]),
            converter();
        {stop} ->
            io:format("Converter stopped.~n", []);
        Other ->
            io:format("Unknown message: ~p~n", [Other]),
            converter()
    end.
