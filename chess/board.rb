require_relative 'piece'
require_relative 'display'

class Board 
  attr_reader :grid

  def initialize 
    @grid = Array.new(8) { Array.new(8) } 
    make_grid
    # iterate through grid and add "moving piece" on [0,1], [7,8]
    # add NullPiece on 2-6 
  end 

  def make_grid
    grid.each_with_index do |row, idx| 
      if idx == 0 || idx == 1 || idx == 6 || idx == 7
        row.map! {|spot| spot = Piece.new}
      end 
    end 
  end

  class NoPieceError < StandardError; end 
  class InvalidMovementError < StandardError; end 

  def move_piece(start_pos, end_pos) 
    Display.render 
    raise NoPieceError if !self[start_pos].is_a?(Piece) 
    # raise InvalidMovementError if !self[end_pos].is_valid? 
    
    self[end_pos], self[start_pos] = self[start_pos], nil 
  end 


  def is_valid? 
    false 
  end 
  
  def [](pos)
    row, col = pos
    grid[row][col]
  end 

  def []=(pos, value)
    row, col = pos 
    grid[row][col] = value 
  end 


end 

