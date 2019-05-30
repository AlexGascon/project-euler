defmodule ProjectEuler.Problem3Test do
  use ExUnit.Case
  
  alias ProjectEuler.Problem3

  test "problem 3" do
    assert 29 == Problem3.largest_prime_factor_of(13195)
  end
end
