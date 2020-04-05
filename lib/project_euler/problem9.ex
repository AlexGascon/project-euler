defmodule ProjectEuler.Problem9 do
  @moduledoc """
  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which

    a^2 + b^2 = c^2

  For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  Find the product a*b*c.
  """

  def pythagorean_triplet_that_sums(number) do
    triplets = for i <- 1..number, j <- (i+1)..number, do: [i, j, number - i - j]

    triplets
    |> Enum.filter(fn [a, b, c] -> square(a) + square(b) == square(c) end)
    |> Enum.find(fn [a, b, c] -> a + b + c == number end)
    |> IO.inspect(label: "Triplet")
    |> Enum.reduce(1, fn num, acc -> num * acc end)
  end

  defp square(n), do: n*n
end
