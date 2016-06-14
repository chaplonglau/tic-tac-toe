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

  def checkWin(cursor)
    if checkWinRow(cursor)
      return true
    elsif checkWinCol(cursor)
      return true
    elsif checkWinRightDiag(cursor)
      return true
    elsif checkWinLeftDiag(cursor)
      return true
    else
      return false
    end
  end

  def checkWinRow(cursor)
    @board.each do |row|
      if (row.all? {|element| element==cursor})
          return true
      end
    end 
    return false
  end

  def checkWinCol(cursor)
    colarray=[]
    for col in 0..2
      for row in 0..2
        colarray << @board[row][col]
      end
      if (colarray.all? {|element| element==cursor})
          return true
      end
      colarray=[]
    end
    return false
  end

  def checkWinRightDiag(cursor)
    colarray=[]
    for row in 0..2
      colarray << @board[row][row]
    end
    if (colarray.all? {|element| element==cursor})
          return true
    end
    return false
  end

  def checkWinLeftDiag(cursor)
    colarray=[]
    colarray << @board[0][2]
    colarray << @board[1][1]
    colarray << @board[2][0]

    if (colarray.all? {|element| element==cursor})
          return true
    end
    return false
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

