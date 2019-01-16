require 'singleton' 

module SlidingPiece 
  def moves 
  end 
end 

module SteppingPiece 
  def moves 
    # consolidate all Rook and Bishop moves here 
    # then have the Queen access and reference the same group of moves 
    rook_moves = [] 
    bishop_moves = [] 
    queen_moves = rook_moves + bishop_moves 
  end 
end 

class Piece 
  attr_accessor :value, :pos, :color

  def initialize(value, pos, color) 
    @value = value 
    @pos = pos 
    @color = color 
  end 

  def inspect 
    "#{self.value}" 
  end 

  def moves 
  end 
end 

class Bishop < Piece 
  include SlidingPiece 

  def initialize(value, pos, color, board)
    super(value, pos, color) 
    @board = board 
  end 

  def move_dirs 
    # which directions? diagonal 
    # how far? as far as possible 
  end 
end 

class Rook < Piece 
  include SlidingPiece 

  def initialize(value, pos, color, board)
    super(value, pos, color) 
    @board = board 
  end 

  def move_dirs 
    # which directions? up, down, left, right 
    # how far? as far as possible 
  end 
end 

class Queen < Piece 
  include SlidingPiece 

  def initialize(value, pos, color, board)
    super(value, pos, color) 
    @board = board 
  end 

  # which directions? diagonal, up, down, left, right 
  # how far? as far as possible 
  # take the non-zero coordinate 
  # we'll iterate from the starting position of that coord 
  # check the incoming diff and determine if there is a piece in the way 
    # if there is a piece?
      # if color is the same, move is invalid
      # otherwise, we take thy enemy's piece, you scoundrel! 
  def move_dirs?(pos_diff) 
    x,y = pos_diff 
    diff = nil 

    if x.zero? 
      diff = y 
      # how do we look at the y value of the start_pos 
    else 
    end 
  end 
end 

class Knight < Piece 
  include SteppingPiece 

  def move_dirs 
    # which directions? moves in an L shape 
    # how far? 2 spots in 1 direction then 1 spot perpendicularly 
    potential_moves = [
      [2, 1],
      [1, 2],
      [-2, 1],
      [-1, 2],
      [2, -1],
      [1, -2],
      [-2, -1],
      [-1, -2]
    ]
    current_pos = [3,4]
    moves = [
      [current_pos[0] + subarray[0], current_pos[1] + subarray[1]], 
    ]

    POT_MOVES.include?(pos_diff) 
  end 
end 

class King < Piece 
  include SteppingPiece 

  def move_dirs 
    #which directions? any 
    # how far? 1 spot at a time 
  end 
end 

class Pawn < Piece 
  def move_dirs 
    #which directions? up (conditionally diagonal if there is a killing blow) 
    # how far? 1 spot at a time 
  end 
end 

class NullPiece < Piece 
  include Singleton 

  def initialize
    @value = "🤡"
    @color = :red
  end 
end 

# four types
  # sliding pieces (bishop, rook, queen) 
  # stepping pieces (knight, king) 
  # pawns (we'll do this class last) 
  # null pieces (occupy the 'empty' spaces) 