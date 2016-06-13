require 'pry'

class Board

  attr_accessor :board, :win_condition


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

  def checkWin
    #check row
    @board.each do |row|
      if (row.all? {|element| element=="x"})
          @win_condition=true
      end
    end 

    #check col 


    @board.each_with_object do |row, colarray|
      @board[row][col].each do |element|
          colarray << element
      end
    end



  end


  def gameOver


  end

end

