defmodule ProjectEuler.UtilsTest do
  use ExUnit.Case

  alias ProjectEuler.Utils

  describe "primes_up_to_n" do
    test "returns all the primes lower or equal to the parameter" do
      assert Utils.primes_up_to(20) |> Enum.to_list == [2, 3, 5, 7, 11, 13, 17, 19]
    end
  end
end
