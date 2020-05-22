defmodule ProjectEuler.Problem10 do
  @moduledoc """
  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
  """

  alias ProjectEuler.Utils

  def sum_all_primes_below(number) do
    Utils.primes_up_to(number)
    |> Enum.sum
  end
end
