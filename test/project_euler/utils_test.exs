defmodule ProjectEuler.UtilsTest do
  use ExUnit.Case

  alias ProjectEuler.Utils

  describe "primes_up_to_n" do
    test "returns all the primes lower or equal to the parameter" do
      assert Utils.primes_up_to(20) == [2, 3, 5, 7, 13, 17]
    end
  end
end
