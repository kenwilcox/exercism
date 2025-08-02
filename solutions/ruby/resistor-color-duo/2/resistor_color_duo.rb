module ResistorColorDuo
  def self.value(items)
    colors = %w[black brown red orange yellow green blue violet grey white]
    indexes = items.map do |item|
      colors.find_index(item).to_s
    end
    indexes.slice(0, 2).join.to_i
  end
end
