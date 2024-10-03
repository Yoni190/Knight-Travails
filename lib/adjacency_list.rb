class AdjacencyList
  attr_accessor :list

  def initialize
    self.list = {}
  end

  def append(square)
    list[square] = []
  end

  def add_edge(square, adjacent_square)
    list[square].push(adjacent_square)
  end

  def to_s
    list.map { |key, value| "#{key}: #{value}" }.join("\n")
  end
end
