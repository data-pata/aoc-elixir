defmodule Aoc.Day01a do
  @spec part1(binary) :: any
  @doc """
  for each term in set
    sought = 2020 - term
    if MapSet.member?(sought)
      return sought * term

  - no lazy eval on read
  - best case = worse case time complexity
  """
  def part1(input) do
    set = input
    |> String.split()
    |> MapSet.new( &(parse_int(&1)) )

    sought? = fn op1, op2, sum -> op1 + op2 == sum end
    find_inner = fn e1, e2  ->
      cond do
        sought?.(e1, e2, 2020) -> e1 * e2
        true -> nil
      end
    end

    Enum.find_value(set, fn elem ->
      Enum.find_value(set,
        &(find_inner.(&1, elem))
      ) end
    )

  end

  defp parse_int(str) do
    {int, _ } = Integer.parse(str)
    int
  end
  def part2(input) do
    set = input
    |> String.split()
    |> MapSet.new( &(parse_int(&1)) )

    sought? = fn op1, op2, op3, sum -> op1 + op2 + op3 == sum end
    find_inner = fn e1, e2, e3  ->
      cond do
        sought?.(e1, e2, e3, 2020) -> e1 * e2 * e3
        true -> nil
      end
    end

    Enum.find_value(set, fn elem1 ->
      Enum.find_value(set, fn elem2 ->
        Enum.find_value(set,
          &(find_inner.(&1, elem1, elem2)))
      end)
    end)

  end

end
