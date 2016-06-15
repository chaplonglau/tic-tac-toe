require_relative 'environment.rb'
require 'pry'


class Runner 
  def run
    welcomer=Welcomer.new
    ipv=InputValidator.new 
    gameBoard=Board.new
    comp=ComputerMover.new

    name=welcomer.welcome
    player=Player.findPlayer(name)

    TicTacToeGame.play(gameBoard,player,comp,ipv)
  end
end

runner=Runner.new
runner.run





