class Welcomer

  def welcome
     puts "Welcome to TicTacToe"
     checkName(promptName)
  end

  def promptName
    puts "What is your name?"
    name=gets.chomp
  end

  def checkName(name)
    existing_player = Player.findPlayer(name)
    if existing_player 
      puts "Welcome back #{existing_player.name}"
    else
      Player.new(name)
      puts "Welcome #{name}"
    end
    name
  end
end