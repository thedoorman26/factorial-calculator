-module(factorial).
-export([start/0, loop/0, factorial/1]).

%% Entry point
start() ->
    io:format("Type a number to calculate its factorial, or 'q' to quit.~n"),
    loop().

%% Main interactive loop
loop() ->
    io:format("Enter number (or q): "),
    Input = io:get_line(""),
    case string:trim(Input) of
        "q" ->
            io:format("Goodbye!~n"),
            ok;

        Trimmed ->
            case string:to_integer(Trimmed) of
                {Int, _Rest} ->
                    Result = factorial(Int),
                    io:format("Factorial: ~p~n", [Result]),
                    loop();  % continue looping

                error ->
                    io:format("Please enter a valid number or 'q'.~n"),
                    loop()   % retry
            end
    end.

%% Recursive factorial function
factorial(0) ->
    1;
factorial(N) when N > 0 ->
    N * factorial(N - 1).