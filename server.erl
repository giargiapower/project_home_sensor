-module(server).
-export([start/0, store/2, lookup/1]).

start() -> register(server, spawn(fun() -> loop() end)).

store(Key, Value) -> send({store, Key, Value}).

lookup(Key) -> send({lookup, Key}).

send(Q) ->
server ! {self(), Q},
receive
{ok, Reply} -> Reply
end.

loop() ->
receive
{From, {store, Key, Value}} -> put(Key, {erlang:localtime(), Value}), From ! {ok, true}, loop();
{From, {lookup, Key}} -> From ! {ok, get(Key)}, loop()
end.

