class AdjacencyList
    attr_accessor :list

    def initialize
        self.list = {}
    end

    def append(square)
        self.list[square] = []
    end

    def add_edge(square, adjacent_square)
        self.list[square].push(adjacent_square)
    end

    def to_s
        puts list
    end
end