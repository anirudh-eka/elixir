dots = %Dot{value: 3, next: %Dot{value: 2}}
dots

IO.puts(dots)
IO.puts("Length : #{Dot.length(dots)}")
IO.puts("add 1 : #{Dot.map(fn x -> x * 2 end, dots)}")