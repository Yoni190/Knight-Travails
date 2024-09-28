require_relative "adjacency_list"


class Knight


    attr_accessor :ad_list

    def initialize
        self.ad_list = AdjacencyList.new
        add_squares(ad_list)
        add_moves(ad_list)

    end


    def knight_moves(starting, ending)
        start_index = find_node_index(start)
        

    end

    def bfs(starting, ending)

        parents = {starting=>"none"}
        first = true
        queue = [start]
        start_index = find_node_index(queue[0])
        visited = [start]
        num_of_nodes = ad_list.adjacency_array[start_index].count_nodes
    
        i = 0
        j = 1

        while !queue.include?(ending)
            while i < num_of_nodes - 1
                queue.push(ad_list.adjacency_array[start_index].at(i + 1).value)
                i += 1
                parents[queue[i]] = visited[j-1]
            end
            if first
                visited.push(queue.shift).uniq!
                first = false
            end
            visited.push(queue.shift)
            
            start_index = find_node_index(visited[j])
            num_of_nodes = ad_list.adjacency_array[start_index].count_nodes
            i = 0
            j += 1
        end
        
        path = reconstruct_path(parents, ending)
        return path
    end

    def reconstruct_path(hash, destination)
        path = [destination]
        ds = destination
        while hash[ds] != "none"
            path.push(hash[ds])
            ds = hash[ds]
        end
        return path
    end


    def add_squares(ad_list)
        x = 0
        y = 0
        while x < 8
            while y < 8
                ad_list.add_node("[#{x}, #{y}]")
                y += 1
            end
            x += 1
            y = 0
        end
    end

    def add_moves(ad_list)
        x = 0
        y = 0
        while x < 8
            while y < 8
                if x + 2 < 8 && y + 1 < 8
                    ad_list.add_edge("[#{x}, #{y}]", "[#{x + 2}, #{y + 1}]")
                end
                if x + 1 < 8 && y + 2 < 8
                    ad_list.add_edge("[#{x}, #{y}]", "[#{x + 1}, #{y + 2}]")
                end
                if x + 2 < 8 && y -1 > 0
                    ad_list.add_edge("[#{x}, #{y}]", "[#{x + 2}, #{y - 1}]")
                end
                if x + 1 < 8 && y - 2 > 8
                    ad_list.add_edge("[#{x}, #{y}]", "[#{x + 1}, #{y - 2}]")
                end
                if x - 2 > 8 && y + 1 < 1
                    ad_list.add_edge("[#{x}, #{y}]", "[#{x - 2}, #{y + 1}]")
                end
                if x - 1 > 8 && y + 2 < 8
                    ad_list.add_edge("[#{x}, #{y}]", "[#{x - 1}, #{y + 2}]")
                end
                if x -2 > 8 && y -1 > 8
                    ad_list.add_edge("[#{x}, #{y}]", "[#{x - 2}, #{y - 1}]")
                end
                if x - 1 > 8 && y - 2 > 8
                    ad_list.add_edge("[#{x}, #{y}]", "[#{x - 1}, #{y - 2}]")
                end
                y += 1
            end
            x += 1
            y = 0
        end
    end

    def find_node_index(value)
        values = ad_list.adjacency_array.map do |element|
            element.head.value
        end
        values.find_index(value)
    end

    def to_s
        puts ad_list
    end



end