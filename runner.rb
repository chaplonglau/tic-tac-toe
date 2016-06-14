require_relative 'environment.rb'
require 'pry'

#PROMPT NAME 


  def promptName
    puts "What is your name?"
    name=gets.chomp

    existing_player = Player.get_players.find { |player| player.name == name }
    if existing_player 
      puts "Welcome back #{existing_player.name}"
    else
      Player.new(name)
    end
    name
  end

  def getInput
    puts "Please select where to put your mark"
    input = gets.chomp.to_i
  end

  def isInputValid(input)
    if input==0
      return false
    else
      return input.is_a?(Integer) && input.between?(0,10)
    end
  end

  
  #checks if that specific square is "-"
  def moveValid(input,gameboard)
    playerInput=input-1

    if (playerInput<=2)
      return gameboard.board[0][playerInput]=="-"
    elsif playerInput.between?(3,5)
      return gameboard.board[1][playerInput-3]=="-"
    else
      return gameboard.board[2][playerInput-6]=="-"
    end
  end

  def makeMove(input,gameboard,cursor)
    playerInput=input-1

    if (playerInput<=2)
      gameboard.board[0][playerInput]=cursor
    elsif playerInput.between?(3,5)
      gameboard.board[1][playerInput-3]=cursor
    else
      gameboard.board[2][playerInput-6]=cursor
    end
  end

  def playerTurn(newGame)
    input=getInput
    #binding.pry
    while ((isInputValid(input) && moveValid(input,newGame))==false)
        #binding.pry
        puts "ENTER THE RIGHT INPUT "
        input=gets.chomp.to_i
    end
    makeMove(input,newGame,"X")
  end


  def computerTurn(newGame)
    input=rand(0..8)
    while ((isInputValid(input) && moveValid(input,newGame))==false)
        #binding.pry
        input=rand(0..8)
    end
    makeMove(input,newGame,"O")
  end

#ACTUALLY RUN THE dang THING
def play
  puts "Welcome to TicTacToe" 
  name=promptName
  newGame=Board.new

  while(newGame.boardfilled==false)
    newGame.printBoard
    playerTurn(newGame)

    if newGame.checkWin("X")==true
      newGame.printBoard
      puts "X WINS"
      
      Player.get_players.find{|player| player.name == name}.track_record["Wins"]+=1
      break
    end

    newGame.printBoard
    puts "Computer takes a turn"
    computerTurn(newGame)

    if newGame.checkWin("O")==true
      newGame.printBoard
      puts "O WINS you suck"

      Player.get_players.find{|player| player.name == name}.track_record["Losses"]+=1

      break
    end

  end

  if (newGame.boardfilled==true)
    puts "TIE GAME"
    Player.get_players.find{|player| player.name == name}.track_record["Ties"]+=1
  end

  puts "GAME FINISHED"
  p Player.get_players.find{|player| player.name == name}.track_record

  playAgain
end


def playAgain
  puts "playagain? y/n"
  rematch=gets.chomp
  if rematch=="y"
    play
  end
  puts "PROGRAM BYE BYE"
  `exit`
end


play




