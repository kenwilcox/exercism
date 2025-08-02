defmodule NameBadge do
  def print(id, name, department) do
    "#{badge_id(id)}#{name} - #{badge_department(department)}"
  end

  defp badge_id(id) do
    if id, do: "[#{id}] - "
  end

  defp badge_department(department) do
    dept = if department, do: department, else: "owner"
    String.upcase(dept)
  end
end
