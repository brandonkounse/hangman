# frozen_string_literal: true

require 'yaml'

# interface for player to interact with hangman game
class Hangman
  attr_reader :dictionary

  def initialize
    @dictionary = File.readlines('google-10000-english-no-swears.txt', chomp: true)
    @dictionary.select! { |words| words.length >= 5 && words.length <= 12 }
  end
end
