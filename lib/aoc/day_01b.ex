defmodule Aoc.Day01b do
  @spec part1(binary) :: any

  @sum 2020

  @doc """
  - no lazy eval on read
  - stops when sum is found
  +
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

  @spec find_value(any, any, any) :: nil
  def find_value(enum, default \\ nil, func) do

  end

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
