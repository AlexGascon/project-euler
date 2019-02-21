defmodule ProjectEuler.Problem1Test do
  use ExUnit.Case
  
  alias ProjectEuler.Problem1

  test "problem 1" do
    assert 23 == Problem1.sum_multiples_of([3, 5], 10)
  end
end