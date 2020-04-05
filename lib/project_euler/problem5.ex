defmodule ProjectEuler.Problem5 do
  @moduledoc """
  2520 is the smallest number that can be divided by each of the numbers from
  1 to 10 without any remainder.

  What is the smallest positive number that is evenly divisible by all of the
  numbers from 1 to 20?
  """

  """
  This problem is more of a maths question than a programming one, so:

  What we need to do is remove the unnecessary divisors:
  We don't need it to be divisible by:
    - 4 if it's divisible by 2 twice
    - 6 if it's divisible by 2 and 3
    - 8 if it's divisible by 2 three times
    - 9 if it's divisible by 3 twice
    - 10 if by 2 and 5
    - 12 if by 2 twice and 3
    - 14 if by 2 and 7
    - 15 if by 3 and 5
    - 16 if by 2 four times
    - 18 if by 3 twice and 2
    - 20 if by 2 twice and 5

  So we only need it to be divisible the numbers in necessary_factors:
  """

  def solution do
    necessary_factors = [2, 2, 2, 2, 3, 3, 5, 7, 11, 13, 17, 19]

    result = Enum.reduce(necessary_factors, fn num, total -> total * num end)
    IO.puts("PROBLEM 5 - Solution: #{result}")
  end
end
