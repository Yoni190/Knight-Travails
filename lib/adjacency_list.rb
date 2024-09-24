require_relative 'linked_list'

class AdjacencyList
    attr_accessor :adjacency_array

    def initialize
        self.adjacency_array = []
    end

    def add_node(value)
        list = LinkedList.new
        list.append(value)
        self.adjacency_array.push(list)
    end

    def add_edge(src, dst)
        values = adjacency_array.map do |element|
            element.head.value
        end
        src_index = values.find_index(src)
        dst_index = values.find_index(dst)
        srcList = adjacency_array[src_index]
        dstList = adjacency_array[dst_index]
        srcList.append(dstList.head.value)
        dstList.append(srcList.head.value)
    end

    def to_s
        puts adjacency_array
    end
end