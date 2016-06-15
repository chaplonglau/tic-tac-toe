
class Player

  @@players=[] 

  attr_accessor :name, :track_record 

  def initialize(name)
    @name=name
    @track_record= {"Wins" => 0, "Ties" => 0, "Losses" => 0}
    @@players << self 
  end

  def self.get_players 
    @@players
  end

  def self.findPlayer(name)
    @@players.find {|player| player.name == name }
  end

  def move(gameBoard,ipv)
    input=getInput
    while ((ipv.isInputValid(input) && moveValid(input,gameBoard))==false)
        puts "ENTER THE RIGHT INPUT "
        input=gets.chomp.to_i
    end
    makeMove(input,gameBoard,"X")
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

      
  def getInput
    puts "Please select where to put your mark"
    input = gets.chomp.to_i
  end

end