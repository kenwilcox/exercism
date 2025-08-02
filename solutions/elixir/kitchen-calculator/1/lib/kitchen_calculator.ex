defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter(volume_pair) do
    {unit, volume} = volume_pair
    case unit do
      :milliliter -> volume_pair
      :cup -> {:milliliter, volume * 240}
      :fluid_ounce -> {:milliliter, volume * 30}
      :teaspoon -> {:milliliter, volume * 5}
      :tablespoon -> {:milliliter, volume * 15}
    end
  end

  def from_milliliter(volume_pair, unit) do
    volume = get_volume(volume_pair)
    case unit do
      :milliliter -> volume_pair
      :cup -> {unit, volume / 240}
      :fluid_ounce -> {unit, volume / 30}
      :teaspoon -> {unit, volume / 5}
      :tablespoon -> {unit, volume / 15}
    end
  end

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end
