module ResistorColorDuo
  def self.value(items)
    # colors = { 'black': '0', 'brown': '1', 'red': '2' }
    colors = { 'black' => '0', 'brown' => '1', 'red' => '2', 'orange' => '3',
               'yellow' => '4', 'green' => '5', 'blue' => '6', 'violet' => '7',
               'grey' => '8', 'white' => '9'}
    ret = ''
    items.each do |x|
      ret += colors[x]
    end
    ret[0..1].to_i
  end
end
