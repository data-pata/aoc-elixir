defmodule Aoc.Day01b do
  @spec part1(binary) :: any

  @sum 2020

  @doc """
  pros/cons
  - no lazy eval on read
  + stops when sum is found
  - linear time complexity of find_value ??
    => use member?/2 for log time
  """
  def part1(input) do
    set = uniq_set(input)

    Enum.find_value(set, fn elem ->
      Enum.find_value(set,
        &( find_inner(&1, elem)))
      end
    )
  end

  def part2(input) do
    set = uniq_set(input)

    Enum.find_value(set, fn elem1 ->
      Enum.find_value(set, fn elem2 ->
        Enum.find_value(set,
          &(find_inner(&1, elem1, elem2)))
      end)
    end)
  end

  # try to get log time in inner loop => ~(n * log n) time
  # for each num in set
  #   sought = 2020 - num
  #   MapSet.member?(sought) -> found
  def part1x(input) do
    set = uniq_set(input)
    try do
      for m <- set, n = 2020 - m, MapSet.member?(set, n) do
        throw {m, n}
      end
    catch
      {m, n} -> m*n
    end
  end

  # def find_value(enum, default \\ nil, func) do
  # end

  defp find_inner(e1, e2) do
    cond do
      sought?(e1, e2) -> e1 * e2
      true -> nil
    end
  end
  defp find_inner(e1, e2, e3) do
    cond do
      sought?(e1, e2, e3) -> e1 * e2 * e3
      true -> nil
    end
  end

  def sought?(op1, op2, op3 \\ 0) do
    op1 + op2 + op3 == @sum
  end

  def uniq_set(str) do
    str
    |> String.split()
    |> MapSet.new( &(parse_int(&1)) )
  end

  defp parse_int(str) do
    {int, _ } = Integer.parse(str)
    int
  end

end
