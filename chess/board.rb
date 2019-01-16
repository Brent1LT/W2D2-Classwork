require_relative 'piece'
require_relative 'display'

WHITE_EMOJIS = {
  rook: '♖', 
  knight: '♘', 
  bishop: '♗', 
  queen: '♕', 
  king: '♔', 
  pawn: '♙', 
}
BLACK_EMOJIS = { 
  rook: '♜', 
  knight: '♞', 
  bishop: '♝', 
  queen: '♛', 
  king: '♚', 
  pawn: '♟', 
}

class Board 
  attr_reader :grid

  def initialize 
    @grid = Array.new(8) { Array.new(8) {NullPiece.instance}} 
    make_grid
    # iterate through grid and add "moving piece" on [0,1], [7,8]
    # add NullPiece on 2-6 
  end 

  def make_grid
    grid.each_index do |idx| 
      case idx
      when 0 
        back_rows(idx, :white) 
      when 1 
        pawn_stars(idx, :white)
      when 6 
        pawn_stars(idx, :black)
      when 7 
        back_rows(idx, :black) 
      end 
    end 
  end

  def pawn_stars(row, color) 
    hash = ((color == :white) ? WHITE_EMOJIS : BLACK_EMOJIS) 
    grid[row].each_index do |col|
      grid[row][col] = Pawn.new(hash[:pawn], [row, col], color) 
    end 
  end 

  def back_rows(row, color) 
    hash = ((color == :white) ? WHITE_EMOJIS : BLACK_EMOJIS) 

    grid[row].map!.with_index do |item, col|
      case col 
      when 0, 7
        grid[row][col] = Rook.new(hash[:rook], [row, col], color, self) 
      when 1, 6
        grid[row][col] = Knight.new(hash[:knight], [row, col], color) 
      when 2, 5 
        grid[row][col] = Bishop.new(hash[:bishop], [row, col], color, self) 
      when 3 
        grid[row][col] = Queen.new(hash[:queen], [row, col], color, self) 
      when 4 
        grid[row][col] = King.new(hash[:king], [row, col], color) 
      end 
    end 
  end 

  class NoPieceError < StandardError; end 
  class InvalidPositionError < StandardError; end 
  class InvalidMovementError < StandardError; end 

  def move_piece(start_pos, end_pos) 
    raise NoPieceError if !self[start_pos].is_a?(Piece) 
    # raise InvalidPositionError if !self[end_pos].valid_pos? 
    # raise InvalidMovementError if !self[end_pos].valid_move? 
    self[end_pos], self[start_pos] = self[start_pos], self[end_pos] 
  end 


  def valid_pos?(pos)
    x,y = pos
    return false if x >= 8 || x < 0
    return false if y >= 8 || y < 0
    #if board[pos] hits a piece of the same of the color 
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

