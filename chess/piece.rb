require 'singleton' 

class Piece 
  attr_reader :value 

  def initialize 
    @value = "Chess_Piece_Here" 
  end 

  def inspect 
    "#{self.value}" 
  end 
end 

class NullPiece < Piece 
  include Singleton 
  # 
end 