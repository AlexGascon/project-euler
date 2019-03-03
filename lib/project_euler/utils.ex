defmodule ProjectEuler.Utils do
  @moduledoc """
    Module with functions that can be useful on more than one problem
  """

  @doc """
  Given a number n, returns a List with all the prime numbers smaller than or equal to n

  It uses the Sieve of Eratosthenes algorithm to achieve it
  """
  @spec primes_up_to(integer) :: list(integer)
  def primes_up_to(n), do: eratosthenes_sieve(2..n, nil)

  defp eratosthenes_sieve(potential_primes, nil) do
    potential_primes
    |> remove_multiples_of(2)
    |> eratosthenes_sieve(2)
  end

  defp eratosthenes_sieve(potential_primes, last_analyzed) do
    num_to_analyze =
      potential_primes
      |> Enum.find(fn num -> num > last_analyzed end)

    if num_to_analyze do
      potential_primes
      |> remove_multiples_of(num_to_analyze)
      |> eratosthenes_sieve(num_to_analyze)
    else
      potential_primes
    end
  end

  defp remove_multiples_of(numbers, n) do
    numbers
    |> Enum.reject(fn num -> (num != n) && rem(num, n) == 0 end)
  end
end