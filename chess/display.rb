require 'colorize'
require_relative 'board'

class Display 
  def self.render 
    board.grid.each { |row| print "#{row}\n" } 
  end 
end 