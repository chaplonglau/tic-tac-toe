require_relative 'environment.rb'


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
    elsif playerInput.between?(2,6)
      return gameboard.board[1][playerInput-3]=="-"
    else
      return gameboard.board[2][playerInput-6]=="-"
    end
  end

  def makeMove(input,gameboard,cursor)
    playerInput=input-1

    if (playerInput<=2)
      gameboard.board[0][playerInput]=cursor
    elsif playerInput.between?(2,6)
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

puts "Welcome to TicTacToe" 
promptName
newGame=Board.new

playerTurn(newGame)
newGame.printBoard

puts "Computer takes a turn"
computerTurn(newGame)
newGame.printBoard

#checkWin/ ends move




puts "hi"

Pry.start