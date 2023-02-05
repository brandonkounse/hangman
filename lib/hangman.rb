# frozen_string_literal: true

require 'yaml'
require './lib/player'

# interface for player to interact with hangman game
class Hangman
  attr_reader :words, :hidden_word, :player

  def initialize
    word_bank
  end

  def add_player
    raise 'maximum players reached!' unless @player.nil?

    @player = Player.new
  end

  def start
    print 'Would you like to start a new game[1] or load[2] a previous game? '
    case @player.input
    when '1'
      @hidden_word = @words[rand(@words.length)]
    when '2'
      load
    else
      puts 'Invalid Selection'
      start
    end
  end

  def load
    # load player file
  end

  def save
    # save progress
  end

  private

  # read in source file and load words 5-12 letters in length
  def word_bank
    @words = File.readlines('google-10000-english-no-swears.txt', chomp: true)
    @words.select! { |words| words.length >= 5 && words.length <= 12 }
  end
end
