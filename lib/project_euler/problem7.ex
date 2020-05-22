defmodule ProjectEuler.Problem7 do
  @moduledoc """
  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
  the 6th prime is 13.

  What is the 10 001st prime number?
  """

  alias ProjectEuler.Utils

  """
  Brute-force solution: we choose a specific number and generate all the primes
  up to it. If there are less than 10k, we choose a bigger number. If not, we
  take the element in the desired position
  """

  def solution do
    position = 10_001

    primes = get_at_least_n_primes(position)

    primes
    |> Enum.at(position - 1)
    |> IO.inspect(label: "Solution")
  end

  defp get_at_least_n_primes(n) do
    starting_point = 30_000 # Chosen at random. For sure it will be more.
    get_at_least_n_primes(n, starting_point)
  end

  defp get_at_least_n_primes(n, limit) do
    primes = Utils.primes_up_to(limit)

    case primes |> Enum.count do
      size when size > n -> primes
      _ -> get_at_least_n_primes(n, limit * 2)
    end
  end
end
