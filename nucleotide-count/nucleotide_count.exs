defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    List.foldl(
      strand,
      0,
      fn currentLetter, count -> if currentLetter == nucleotide, do: count + 1, else: count end
    )
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    count = %{?A => 0, ?C => 0, ?G => 0, ?T => 0}

    List.foldl(
      strand,
      count,
      fn current, counter -> Map.replace(counter, current, counter[current] + 1) end
    )

  end
end
