class TicTacToeGame
  def self.play(gameBoard, player, comp, ipv)
    while(gameBoard.boardfilled==false)
      gameBoard.printBoard
      player.move(gameBoard,ipv)

      if gameBoard.checkWin("X")==true
        gameBoard.printBoard
        puts "X WINS"
        player.track_record["Wins"]+=1
        break
      end

      break if gameBoard.boardfilled==true

      gameBoard.printBoard
      puts "Computer takes a turn"
      comp.move(gameBoard, ipv)

      if gameBoard.checkWin("O")==true
        gameBoard.printBoard
        puts "O WINS you suck"
        player.track_record["Losses"]+=1
        break
      end
    end

    if (gameBoard.boardfilled==true && gameBoard.checkWin("X")==false && gameBoard.checkWin("O")==false)
      gameBoard.printBoard
      puts "TIE GAME"
      player.track_record["Ties"]+=1
    end
    puts "GAME FINISHED"


    p player.track_record
    
    playAgain(player, ipv)
  end

  def self.playAgain(player, ipv)
    puts "playagain? y/n"
    rematch=gets.chomp
    if rematch=="y"
      play(Board.new, player, ComputerMover.new, ipv)
    else
      puts "PROGRAM BYE BYE"
      `exit`
    end
  end


end
