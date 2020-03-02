defmodule Dot do
    defstruct value: nil, next: nil
    def head(%Dot{value: v}), do: v
    def head(%Dot{}), do: nil

    def tail(%Dot{next: next}), do: next

    def length(dots), do: reduce(fn a, _ -> a + 1 end, 0, dots)

    def map(f, %Dot{value: value, next: next}) do
        reduce(fn a, x -> %{a | next: %Dot{value: f.(x)}} end, %Dot{value: f.(value)}, next)
    end

    def reduce(_, a, nil), do: a
    def reduce(f, a, %Dot{value: value, next: next}) do
        reduce(f, f.(a, value), next)
    end
end

defimpl String.Chars, for: Dot do
  def to_string(dots) do
    Dot.reduce(fn a, v -> a <> " - #{v}" end, "*", dots)
  end
end