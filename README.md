# Learning Elixir

This is just an exploration of Elixir. It assumes you have it installed. There is no build tool so you have to compile each file seperately.

```
elixirc dot.ex
elixirc main.ex
```

## main.ex

This file is where I play with different libs I created in the other files.

## dot.ex - Linked List

`./dot.ex` is an implementation of a Linked List. It's using `defstruct`, which is built on top of maps offering some compile-time checks and default values. Structs need to be defined inside modules. The values of it's keys can still be anything because of dynamic typing, but at least it makes sure that has only the defined in the struct.

In order to print a struct, we need to implement the `String.Chars` protocol by defining the `to_string(dots)` function. We use `defimpl` to do this. (This reminds me of using the `instance` keyword when defining an instance of a typeclass in Haskell.) Now we're able to call `IO.puts(dots)` and Elixir can actually print it.

I'm guessing, the reason why it's not enough to define `to_string(dots)` in the `defmodule Dot` is because functions in modules don't necessarily have any connection to a struct in that module. Remember modules are not class definitions! The functions could operate on any type. If we define a `to_string()` function in this module there is no guarantee that it will take in dots. Nothing stops us from making it take a list or map or something else. `defimpl` requires us to specifically state which struct we are defining this for. The `for` in `defimpl String.Chars, for: Dot` lets elixir know this is the implementation for our new struct.

