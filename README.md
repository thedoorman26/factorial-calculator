# Overview

This is a collection of 3 relatively simple programs written in Erlang. They act as follows:
- The first program is a factorial calculator. The user if prompted to input a number, when the program returns that numbers factorial value (x!).
- The second program is a fibonacci calculator. After the user inputs a number, the program returns the number of the fibonacci sequence that the input is indexed to (i.e. 6 will return 8). Memoization was used to improve compute time for high values.
- The third program is a list manipulation tool. The user inputs a list of numbers separated by spaces, and the program gives them options to reverse the list, compute its length, or determine if it is palindromic.

I wrote this collection of programs to get some first-time experience using Erlang, as I have never used it before.

Here's a link to a YouTube demonstration of my program.
[Software Demo Video](https://www.youtube.com/watch?v=cyKJzf7MCj0)

# Development Environment

I used Visual Studio Code as my IDE, and the language was Erlang.
I used rebar3 as a build tool, which made compiling the code a bit easier.

# Useful Websites

Here are some links to resources that I found helpful:
* [Erlang official documentation](https://www.erlang.org/doc/readme.html)
* [Geeks for Geeks tutorial on memoization](https://www.geeksforgeeks.org/dsa/what-is-memoization-a-complete-tutorial/)

# Future Work

Some things I'd like to add/change in the future:
* More list manipulation tools
* Cleaner output presentation
