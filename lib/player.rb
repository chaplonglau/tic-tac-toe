
class Player

  @@players=[] 

  attr_accessor :name, :track_record 

  def initialize(name)
    @name=name
    @track_record= {"Wins" => 0, "Losses" => 0}
    @@players << self 
  end

  def self.get_players 
    @@players
  end

end