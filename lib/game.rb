require './lib/player'
require './lib/computer'

class Game

  attr_reader :player_1, :player_2, :result

CHOICE = [:rock, :paper, :scissors]

BEATS = { rock: :paper,
          paper: :scissors,
          scissors: :rock}

  def initialize(player_1, player_2=Computer.new)
    @player_1 = Player.new(player_2)
    @player_2 = player_2
    @player_2 = Player.new(player_2) unless @player_2.is_a?(Computer)
  end

  def computer
    @player_2.select_weapon
  end

  def result
    @result = 'lost'
    @result= 'tied' if @player_1.weapon == @player_2.weapon
    @result = 'won' if @player_1.weapon == BEATS[@player_2.weapon]
  end

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game
  end

end
