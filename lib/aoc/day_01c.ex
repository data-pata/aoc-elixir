defmodule Aoc.Day01c do
  @spec part1(binary) :: any

  @sum 2020

  @doc """
  - no lazy eval on read
  - stops when sum is found
  +
  """
  def part1(input) do
    lst = uniq_list(input)

    Enum.find_value(lst, fn elem ->
      Enum.find_value(lst,
        &( find_inner(&1, elem)))
      end
    )
  end

  def part2(input) do
    lst = uniq_list(input)

    Enum.find_value(lst, fn elem1 ->
      Enum.find_value(lst, fn elem2 ->
        Enum.find_value(lst,
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

  def uniq_list(str) do
    str |> String.split()
    |> uniq([])
  end

  defp uniq([], lst), do: lst
  defp uniq([h | t], acc) do
    if contains?(h, acc) do
      uniq(t, acc)
    else
      uniq()
    end
  end

  def contains?(_, []), do: false
  def contains?(elem, [elem|_]), do: true
  def contains?(elem, [_|t]), do: contains?(elem, t)



  defp parse_int(str) do
    {int, _ } = Integer.parse(str)
    int
  end

end
