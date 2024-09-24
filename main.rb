


def knight_moves(init_square, desired_square)
    if init_square[0] > 7 || init_square[1] > 7 || desired_square[0] > 7 || desired_square[1] > 7
        puts "Invalid Square"
    end
end

knight_moves([1,2], [8,4])