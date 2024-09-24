require_relative 'linked_list'

class AdjacencyList
    attr_accessor :adjacency_array

    def initialize
        self.adjacency_array = []
    end

    def addNode(value)
        list = LinkedList.new
        list.append(value)
        self.adjacency_array.push(list)
    end

    def addEdge(src, dst)
        srcList = self.adjacency_array[src]
        dstList = self.adjacency_array[dst]
        srcList.append(dstList.head.value)
        dstList.append(srcList.head.value)
    end

    def to_s
        puts adjacency_array
    end
end