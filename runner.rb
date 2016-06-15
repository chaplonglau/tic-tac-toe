require_relative 'environment.rb'
require 'pry'


#ACTUALLY RUN THE dang THING
def play
  puts "Welcome to TicTacToe"
  name=promptName
  newBoard=Board.new
  newGame=Game.new

  while(newBoard.boardfilled==false)
    newBoard.printBoard
    playerTurn(newGame)

    if newGame.checkWin("X")==true
      Game.playerWins(newBoard)
      break
    end

    newBoard.printBoard
    puts "Computer takes a turn"
    computerTurn(newGame)

    if newGame.checkWin("O")==true
      Game.computerWins(newBoard)
      break
    end

  end

  if (newBoard.boardfilled==true)
    Game.draw
  end

  Game.finished
  Game.playAgain
end

play




