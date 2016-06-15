class Game

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

  def playerWins
    newBoard.printBoard
    puts "X WINS"

    Player.get_players.find{|player| player.name == name}.track_record["Wins"]+=1
  end

  def computerWins
    newBoard.printBoard
    puts "O WINS you suck"

    Player.get_players.find{|player| player.name == name}.track_record["Losses"]+=1
  end

  def draw
    puts "TIE GAME"
    Player.get_players.find{|player| player.name == name}.track_record["Ties"]+=1
  end

  def finished
    puts "GAME FINISHED"
    p Player.get_players.find{|player| player.name == name}.track_record
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
  
end
