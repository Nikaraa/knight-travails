require_relative "knight.rb"

class Board
  def knight_moves(start, destination)
    current = make_tree(start, destination)
    count = count_moves(current, start)
    console_print(count, start, destination)
  end

  def make_tree(start, finish)
    queue = [Knight.new(start)]
    current = queue.shift
    count = 0
    until current.position == finish
      current.all_moves.each do |move|
        current.children.push(knight = Knight.new(move, current))
        queue.push(knight)
      end
      current = queue.shift
    end
    current
  end

  def count_moves(current, start)
    count = 0
    until current.position == start
      count += 1
      current = current.parent
    end
    count
  end

  def console_print(count, start, destination)
    puts "You made it in #{count} moves to get from #{start} to #{destination}!"
  end
end
