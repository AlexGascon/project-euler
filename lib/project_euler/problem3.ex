defmodule ProjectEuler.Problem3 do
  @moduledoc """
    The prime factors of 13195 are 5, 7, 13 and 29.

    What is the largest prime factor of the number 600851475143?
  """

  alias ProjectEuler.Utils

  def largest_prime_factor_of(number) do
    2..div(number, 2)
    |> Stream.filter(&is_factor_of?(number, &1))
    |> Stream.filter(&is_prime?(&1))
    |> Enum.max
  end

"""
  def largest_prime_factor_of(number) do
    Utils.primes_up_to(number - 1)
    |> Stream.filter(fn prime -> rem(number, prime) == 0 end)
    |> Enum.max
  end
"""
  def is_factor_of?(number, factor) do
    rem(number, factor) == 0
  end

  def is_prime?(potential_prime) do
    x = 2..div(potential_prime, 2)
    |> Enum.filter(fn n -> rem(potential_prime, n) == 0 end)

    Enum.count(x) == 0
  end
end
