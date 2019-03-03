defmodule ProjectEuler.Problem4Test do
  use ExUnit.Case
  
  alias ProjectEuler.Problem4

  test "problem 4" do
    assert 9009 == Problem4.largest_palindrome_product(99)
  end
end
