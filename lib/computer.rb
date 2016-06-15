class Computer

  def move(gameBoard)
    input=rand(0..8)
    while ((isInputValid(input) && moveValid(input,gameBoard))==false)
        input=rand(0..8)
    end
    makeMove(input,gameBoard,"O")
  end

  def isInputValid(input)
    input.is_a?(Integer) && input.between?(1,9)
  end

  def moveValid(input,gameBoard)
    playerInput=input-1

    if (playerInput<=2)
      return gameBoard.board[0][playerInput]=="-"
    elsif playerInput.between?(3,5)
      return gameBoard.board[1][playerInput-3]=="-"
    else
      return gameBoard.board[2][playerInput-6]=="-"
    end
  end

  def makeMove(input,gameBoard,cursor)
    playerInput=input-1

    if (playerInput<=2)
      gameBoard.board[0][playerInput]=cursor
    elsif playerInput.between?(3,5)
      gameBoard.board[1][playerInput-3]=cursor
    else
      gameBoard.board[2][playerInput-6]=cursor
    end
  end

end