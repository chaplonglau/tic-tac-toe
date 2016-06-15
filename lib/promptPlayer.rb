class PromptPlayer

  def initialize()
    
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
  
end
