defmodule ProjectEuler.Problem3 do
  @moduledoc """
    The prime factors of 13195 are 5, 7, 13 and 29.

    What is the largest prime factor of the number 600851475143?
  """

  alias ProjectEuler.Utils

  """
    solution = largest_prime_factor_of 600851475143

    Problem: it is a really long computation and iex kills the process before it
    finishes. Try to look for a more efficient way
  """

  def largest_prime_factor_of(number) do
    Utils.primes_up_to(number - 1)
    |> Stream.filter(&is_factor_of?(number, &1))
    |> Enum.max
  end

  def is_factor_of?(number, factor) do
    rem(number, factor) == 0
  end
end
