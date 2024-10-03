require_relative "adjacency_list"


class Knight


    attr_accessor :ad_list

    def initialize
        self.ad_list = AdjacencyList.new
        add_squares(ad_list)
        add_moves(ad_list)

    end


    def knight_moves(starting, ending)
        path = bfs(starting, ending).reverse
        puts "You've made it in #{path.length} moves!"
        path.each {|element| p element}
    end

    def bfs(starting, ending)
        parents = {starting => nil}
        queue = [starting]
        visited = []

        while !queue.include?(ending)

            adjacent_squares = ad_list.list[starting]
            adjacent_squares.each do |adjacent_square| 
                if !visited.include?(adjacent_square)
                    queue.push(adjacent_square)
                end
                if !parents.include?(adjacent_square)
                    parents[adjacent_square] = starting
                end
            end
            visited.push(queue.shift).uniq!
            starting = queue[0]
        end
        reconstruct_path(parents, ending)
    end

    def reconstruct_path(hash, destination)
        ds = destination
        path = [ds]
        while !hash[ds].nil?
            path.push(hash[ds])
            ds = hash[ds]
        end
        path
    end


    def add_squares(ad_list)
        x = 0
        y = 0
        while x < 8
            while y < 8
                ad_list.append([x, y])
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
                    ad_list.add_edge([x, y], [x + 2, y + 1])
                end
                if x + 1 < 8 && y + 2 < 8
                    ad_list.add_edge([x,  y], [x + 1, y + 2])
                end
                if x + 2 < 8 && y - 1 >= 0
                    ad_list.add_edge([x,  y], [x + 2, y - 1])
                end
                if x + 1 < 8 && y - 2 >= 0
                    ad_list.add_edge([x,  y], [x + 1, y - 2])
                end
                if x - 2 >= 0 && y + 1 < 8
                    ad_list.add_edge([x,  y], [x - 2, y + 1])
                end
                if x - 1 >= 0 && y + 2 < 8
                    ad_list.add_edge([x,  y], [x - 1, y + 2])
                end
                if x -2 >= 0 && y -1 >= 0
                    ad_list.add_edge([x,  y], [x - 2, y - 1])
                end
                if x - 1 >= 0 && y - 2 >= 0
                    ad_list.add_edge([x,  y], [x - 1, y - 2])
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