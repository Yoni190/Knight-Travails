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

    def addEdge(int src, int dst)
        list = adjacency_array[src]
        dstNode = adjacency_array[dst]
        list.append(dstNode)
    end

end