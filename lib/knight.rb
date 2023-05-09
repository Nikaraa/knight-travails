class Knight
  attr_reader :position
  attr_accessor :children, :parent
  MOVES = [[-2, -1], [-2, 1], [-1, 2], [-1, -2], [1, 2], [1, -2], [2, -1], [2, 1]].freeze

  def initialize(position, parent = nil)
    @position = position
    @parent = parent
    @children = []
  end

  def all_moves
    possible_moves = MOVES.map do |move|
      move.each_with_index.map do |n, i|
        n + @position[i] unless (n + @position[i]).negative? || (n + @position[i] > 7)
      end
    end
    possible_moves.delete_if{|move| move.include?(nil)}
  end
end
