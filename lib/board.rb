require_relative "knight.rb"

class Board
  def knight_moves(start, destination)
    current = make_tree(start, destination)
    pool = count_moves(current, start)
    console_print(pool, start, destination)
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
    pool = []
    until current.position == start
      pool.push(current.position)
      current = current.parent
    end
    pool.push(current.position)
  end

  def console_print(pool, start, destination)
    puts "You made it in #{pool.size-1} moves to get from #{start} to #{destination}!"
    puts "Those are the moves you must do: "
    pool.reverse.each do |move|
        puts move.to_s
    end
  end
end
