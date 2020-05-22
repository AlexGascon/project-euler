defmodule ProjectEuler.Matrix do
  defstruct structure: []

  def from_string(text) do
    elements =
      text
      |> String.trim
      |> String.split("\n")
      |> Enum.map(&parse_row/1)

    %ProjectEuler.Matrix{structure: elements}
  end

  defp parse_row(row_string) do
    row_string
      |> String.split
      |> Enum.map(&String.to_integer/1)
  end

  def elements(matrix) do
    matrix.structure |> List.flatten
  end

  def at(matrix, row, column) do
    matrix.structure
    |> Enum.at(row - 1)
    |> Enum.at(column - 1)
  end

  def at(matrix, indexes) do
    indexes |> Enum.map(fn [row, column] -> at(matrix, row, column) end)
  end

  def size(matrix) do
    num_rows = matrix.structure |> Enum.count

    first_row = matrix.structure |> Enum.at(0)
    num_columns = first_row |> Enum.count

    [num_rows, num_columns]
  end

  def rows(matrix) do
    matrix.structure
  end

  def columns(matrix) do
    [num_rows, num_columns] = matrix |> size

    for i <- 1..num_rows do
      for j <- 1..num_columns do
        at(matrix, j, i)
      end
    end
  end

  """
  123
  456

  4 - 21
  15 - 11,22
  26 - 22,33
  3 - 13
  --
  1 - 11
  24 - 12,21
  35 - 13,22
  6 - 23
"""

  def diagonals(matrix) do
    # Follows this algorithm: https://stackoverflow.com/a/6313407/1538479
    regular_diagonals =
      matrix
      |> size
      |> get_diagonal_indexes
      |> Enum.map(fn indexes -> matrix |> at(indexes) end)

    reverse_diagonals =
      matrix
      |> size
      |> get_reverse_diagonal_indexes
      |> Enum.map(fn indexes -> matrix |> at(indexes) end)

    regular_diagonals ++ reverse_diagonals
  end

  defp get_diagonal_indexes([max_rows, max_cols]) do
    offsets = (-max_rows)..(max_rows+1)
    row_nums = 1..max_rows

    Enum.map(offsets, fn offset ->
      Enum.map(row_nums, fn row ->
        col = row + offset
        cond do
          col > (max_cols) ->
            nil
          col < 1 ->
            nil
          true ->
            [row, col]
        end
      end) |> Enum.reject(&is_nil/1)
    end) |> Enum.reject(&Enum.count(&1) == 0)
  end

  defp get_reverse_diagonal_indexes([max_rows, max_cols]) do
    sums = 2..(max_rows + max_cols)
    row_nums = 1..max_rows

    Enum.map(sums, fn sum ->
      Enum.map(row_nums, fn row ->
        col = sum - row
        cond do
          col > (max_cols) ->
            nil
          col < 1 ->
            nil
          true ->
            [row, col]
        end
      end) |> Enum.reject(&is_nil/1)
    end) |> Enum.reject(&Enum.count(&1) == 0)
  end
end
