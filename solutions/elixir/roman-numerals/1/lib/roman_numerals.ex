defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @chars [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]
  @spec numeral(pos_integer) :: String.t()
  def numeral(0), do: ""
  def numeral(number) do
    {x, num} = Enum.find(@chars, fn({k, _}) -> number >= k end)
    num <> numeral(number - x)
  end
end
