-module(list_tools).
-export([start/0]).

%% entry point
start() ->
    io:format("Enter a list of integers separated by spaces: "),
    Input = io:get_line(""),
    List = parse_list(Input),
    menu(List).

%% parse input string into a list of integers using lists:map
parse_list(Str) ->
    Words = string:tokens(string:trim(Str), " "),
    lists:map(fun(X) -> list_to_integer(X) end, Words).

%% display menu and handle user choices
menu(List) ->
    io:format("\nCurrent list: ~p~n", [List]),
    io:format("Choose an option:~n"),
    io:format("  1) Reverse the list~n"),
    io:format("  2) Get length of the list~n"),
    io:format("  3) Check if palindromic~n"),
    io:format("  4) Enter a new list~n"),
    io:format("  5) Quit~n"),
    io:format("Your choice: "),
    ChoiceStr = io:get_line(""),
    Choice = string:trim(ChoiceStr),

    case Choice of
        "1" ->
            Reversed = lists:reverse(List),
            io:format("Reversed list: ~p~n", [Reversed]),
            menu(List);
        "2" ->
            %% use lists:foldl to compute length manually
            Length = lists:foldl(fun(_, Acc) -> Acc + 1 end, 0, List),
            io:format("Length: ~p~n", [Length]),
            menu(List);
        "3" ->
            IsPal = List =:= lists:reverse(List),
            case IsPal of
                true -> io:format("The list IS palindromic.~n");
                false -> io:format("The list is NOT palindromic.~n")
            end,
            menu(List);
        "4" ->
            start(); %% enter a new list
        "5" ->
            io:format("Goodbye!~n"),
            ok;
        _ ->
            io:format("Invalid choice. Try again.~n"),
            menu(List)
    end.
