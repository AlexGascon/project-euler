"""
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
"""

defmodule ProjectEuler.Problem1 do
  def sum_multiples_of(multiples, limit) do
    1..(limit-1)
    |> Stream.filter(&is_multiple_of_any?(&1, multiples))
    |> Enum.sum
  end

  defp is_multiple_of_any?(number, multiples) do
    multiples
    |> Enum.any?(fn multiple -> rem(number, multiple) == 0 end)
  end
end
