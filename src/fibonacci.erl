-module(fibonacci).
-export([start/0]).

start() ->
    %% create ets table for memoization if not already created
    case ets:info(fib_cache) of
        undefined ->
            ets:new(fib_cache, [named_table, public, set]),
            ets:insert(fib_cache, [{0, 0}, {1, 1}]); % needs to have at least 2 set values for later function
        _ -> ok
    end,

    loop().

%% main loop to repeatedly get user input
loop() ->
    io:format("Enter a non-negative integer for Fibonacci (or 'q' to quit): "),
    case io:get_line("") of
        eof -> ok;
        "q\n" -> ok;
        Line ->
            case parse_int(Line) of
                {ok, N} when N >= 0 ->
                    Result = fib(N),
                    io:format("F(~p) = ~p~n", [N, Result]),
                    loop();

                {ok, _Negative} ->
                    io:format("Negative numbers are rejected. Try again.~n"),
                    loop();

                error ->
                    io:format("Invalid input. Enter a non-negative integer.~n"),
                    loop()
            end
    end.

%% Safe integer parse
parse_int(Line) ->
    case string:to_integer(string:trim(Line)) of
        {error, _} -> error;
        {Int, _Rest} -> {ok, Int}
    end.

%% memoized fibonacci function
fib(N) ->
    %% check cache first, returns value if already cached
    case ets:lookup(fib_cache, N) of
        [{N, Value}] ->
            Value;

        [] ->
            %% if not cached, compute recursively
            Value = fib(N - 1) + fib(N - 2),
            ets:insert(fib_cache, {N, Value}),
            Value
    end.
