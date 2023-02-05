# frozen_string_literal: true

# class for player to interface with game logic
class Player
  attr_reader

  def input
    gets.chomp
  end
end
