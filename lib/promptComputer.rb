class PromptComputer

  attr_reader :newGame

  def initialize(newGame)
    @newGame = newGame
  end

  def computerTurn
    input=rand(0..8)
    while ((isInputValid(input) && moveValid(input,newGame))==false)
        #binding.pry
        input=rand(0..8)
    end
    Game.makeMove(input, @newGame,"O")
  end
end
