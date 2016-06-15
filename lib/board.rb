require 'pry'

class Board

  attr_accessor :board


  def initialize
    @board= [["-","-","-"],["-","-","-"],["-","-","-"]]
    @helpBoard= [["1","2","3"],["4","5","6"],["7","8","9"]]
  end


  def printHelpBoard
    @helpBoard.each do |row|
      p row
    end
  end

  def printBoard
    @board.each do |row|
      p row
    end
  end

  def boardfilled
    @board.each do |row|
      if (row.any? {|element| element=="-"})
        return false
      end
    end
    return false
  end

end

