defmodule ProjectEuler.MatrixTest do
  use ExUnit.Case

  alias ProjectEuler.Matrix

  test "from_string" do
    text = """
    1 2
    3 4
    """

    expected = %Matrix{structure: [[1, 2], [3, 4]]}
    assert expected == Matrix.from_string(text)
  end

  test "at/3" do
    matrix = %Matrix{structure: [[1, 2], [3, 4]]}

    assert 2 == matrix |> Matrix.at(1, 2)
    assert 3 == matrix |> Matrix.at(2, 1)
  end

  test "at/2" do
    matrix = %Matrix{structure: [[1, 2], [3, 4]]}

    assert [2, 3] == matrix |> Matrix.at([[1, 2], [2, 1]])
  end

  test "size" do
    matrix_1 = %Matrix{structure: [[1, 2, 3], [4, 5, 6]]}
    assert [2, 3] == matrix_1 |> Matrix.size

    matrix_2 = %Matrix{structure: [[1, 2], [3, 4], [5, 6]]}
    assert [3, 2] == matrix_2 |> Matrix.size
  end

  test "rows" do
    matrix = %Matrix{structure: [[1, 2], [3, 4]]}

    assert [[1, 2], [3, 4]] == matrix |> Matrix.rows
  end

  test "columns" do
    matrix = %Matrix{structure: [[1, 2], [3, 4]]}

    assert [[1, 3], [2, 4]] == matrix |> Matrix.columns
  end

  test "diagonals/1 on a square matrix" do
    matrix_3 = %Matrix{structure: [[1, 2, 3], [4, 5, 6], [7, 8, 9]]}
    diagonals = [[7], [4, 8], [1, 5, 9], [2, 6], [3]]
    reverse_diagonals = [[9], [6, 8], [3, 5, 7], [2, 4], [1]]
    expected_diagonals = diagonals ++ reverse_diagonals

    assert Enum.sort(expected_diagonals) == matrix_3 |> Matrix.diagonals |> Enum.sort
  end

  test "diagonals/1 on a non-square matrix" do
    matrix_1 = %Matrix{structure: [[1, 2, 3], [4, 5, 6]]}
    diagonals = [[4], [1, 5], [2, 6], [3]]
    reverse_diagonals = [[6], [3, 5], [2, 4], [1]]
    expected_diagonals = diagonals ++ reverse_diagonals

    assert Enum.sort(expected_diagonals) == matrix_1 |> Matrix.diagonals |> Enum.sort


    matrix_2 = %Matrix{structure: [[1, 2], [3, 4], [5, 6]]}
    diagonals = [[5], [3, 6], [1, 4], [2]]
    reverse_diagonals = [[6], [4, 5], [2, 3], [1]]
    expected_diagonals = diagonals ++ reverse_diagonals

    assert Enum.sort(expected_diagonals) == matrix_2 |> Matrix.diagonals |> Enum.sort
  end

  test "elements" do
    matrix = %Matrix{structure: [[1, 2], [3, 4]]}

    assert [1, 2, 3, 4] == matrix |> Matrix.elements
  end
end
