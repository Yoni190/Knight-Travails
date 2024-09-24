require_relative 'linked_list'

class AdjacencyList
    attr_accessor :adjacency_array
    @@size = 64

    def initialize
        self.adjacency_array = Array.new(@@size)
    end

    def addNode(value)
        list = LinkedList.new
        list.append(value)
        self.adjacency_array.push(list)
    end


end