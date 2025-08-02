defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, workers) do
    texts
    |> Task.async_stream(fn text ->
      text
      |> String.downcase
      |> String.replace(~r/[^[:alpha:]]/u, "")
      |> String.codepoints
      |> Enum.frequencies
    end, max_Concurrency: workers)
    |> Enum.reduce(%{}, fn {:ok, x2}, x1 -> Map.merge(x1,x2,fn _,y1,y2->y1+y2 end) 
    end)
  end
end
