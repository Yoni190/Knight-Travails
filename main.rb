require_relative 'lib/adjacency_list'

ad_list = AdjacencyList.new


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


add_squares(ad_list)
add_moves(ad_list)

#ad_list.to_s
puts ad_list