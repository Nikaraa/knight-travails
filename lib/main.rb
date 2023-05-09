require_relative "knight.rb"
require_relative "board.rb"

chessboard = Board.new

chessboard.knight_moves([0, 0], [1, 2])
chessboard.knight_moves([0, 0], [3, 3])
chessboard.knight_moves([3, 3], [0, 0])
chessboard.knight_moves([3,3],[4,3])