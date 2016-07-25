
class Computer

  attr_reader :name, :weapon

  def initialize
    @name = 'Computer'
    @weapon = nil
  end

  def select_weapon
    @weapon = Game::CHOICE.sample
  end

end
