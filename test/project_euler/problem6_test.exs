defmodule ProjectEuler.Problem6Test do
  use ExUnit.Case
  
  alias ProjectEuler.Problem6

  test "problem 6" do
    assert 2640 == Problem6.sum_square_difference_of_first(10)
  end
end