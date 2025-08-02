defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    maximum_price = Keyword.get(options, :maximum_price, 100.00)

    for top <- tops,
        bottom <- bottoms,
        combination = {top, bottom},
        different_color?(combination) and total_price(combination) < maximum_price do
      combination
    end
  end

  defp different_color?({top, bottom}) do
    top.base_color != bottom.base_color
  end

  defp total_price({top, bottom}) do
    top.price + bottom.price
  end
end
