defmodule ProjectEuler.Problem4 do
  @moduledoc """
  A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
  """

  # Brute-force solution, can be improved
  def largest_palindrome_product(limit) do
    products = for i <- limit..1, j <- limit..1, do: i * j

    products
    |> Stream.filter(&is_palindrome?/1)
    |> Enum.max
  end

  defp is_palindrome?(number) do
    number_str = Integer.to_string(number)

    number_str == String.reverse(number_str)
  end
end
