# ListsAndRecursion-4 p81
# defmodule MyList do
#   def span(to, to), do: [to]

#   def span(from, to) do
#     [from | span(from + 1, to)]
#   end
# end

# # ModulesAndFunctions-4+5 p57
# defmodule Recursion do
#   def ajouter(1), do: 1
#   def ajouter(n), do: n + ajouter(n - 1)

#   def gcd(x, 0), do: x
#   def gcd(x, y), do: gcd(y, rem(x, y))
# end

# defmodule Times do
#   def double(n) do
#     n * 2
#   end

#   # ModulesAndFunctions-1 p55
#   def triple(n) do
#     n * 3
#   end

#   # ModulesAndFunctions-3 p55
#   def quadruple(n) do
#     n |> double |> double
#   end
# end

# Functions-5 p50
# Enum.map [1,2,3,4], &(&1 + 2)
# Enum.each [1,2,3,4], &(IO.inspect(&1))

# Functions-4 p47
# prefix = fn first -> fn second -> "#{first} #{second}" end end

# # Functions-2 p45
# fizz_to_buzz = fn
#   0, 0, _ -> "FizzBuzz"
#   0, _, _ -> "Fizz"
#   _, 0, _ -> "Buzz"
#   _, _, value -> value
# end
# IO.puts fizz_to_buzz.(0, 0, 3)

# # Functions-3 p45
# fizzbuzz = fn
#   n -> fizz_to_buzz.(rem(n,3), rem(n,5), n)
# end
# IO.puts fizzbuzz.(11)
