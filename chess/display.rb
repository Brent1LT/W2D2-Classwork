require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display 
  attr_reader :board 

  def initialize(board)
    @board = board 
    @cursor = Cursor.new([0,0], board) 
  end 
  
  def render 
    puts 
    # print board[@cursor.cursor_pos].value.colorize(background: :red) 
    board.grid.each { |row| print "#{row}\n" } 
    # have a nested iteration to iterate through each row then through each piece 
    # depending on the cursor position, if the current el matches, we should colorize it 
    puts 

    # pick out the position on the board of where the cursor is and then colorize it 
    # use the board.grid ivar and pass it the cursor's position 
    # board[@cursor_pos].colorize 
  end 

  def move_cursor 
    while true 
      @cursor.get_input 
      self.render 
    end 
  end 
end 

# use ctrl-cmd-space to bring up the emoji window 

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board) 
  display.render 
end 