defmodule ProjectEuler.Problem6 do
  @moduledoc """
  The sum of the squares of the first ten natural numbers is,
  1^2 + 2^2 + ... + 10^2 = 385

  The square of the sum of the first ten natural numbers is,
  (1 + 2 + ... + 10)^2 = 55^2 = 3025

  Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

  Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
  """

  def sum_square_difference_of_first(n) do
    square_of_the_sum_of_first(n) - sum_of_squares_of_first(n)
  end

  defp sum_of_squares_of_first(n) do
    1..n
    |> Stream.map(&square/1)
    |> Enum.sum
  end

  defp square_of_the_sum_of_first(n) do
    1..n
    |> Enum.sum
    |> square
  end

  defp square(n), do: n |> :math.pow(2)
end