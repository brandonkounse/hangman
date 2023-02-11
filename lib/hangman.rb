# frozen_string_literal: true

require 'yaml'
require './lib/player'

# interface for player to interact with hangman game
class Hangman
  MAX_TURNS = 7

  attr_reader :words, :hidden_word, :player, :turn

  def initialize
    create_word_bank
    @turn = 0
  end

  def add_player
    raise 'maximum players reached!' unless @player.nil?

    @player = Player.new
  end

  def setup
    print 'Would you like to start a new game[1] or load[2] a previous game? '
    case @player.input
    when '1'
      new_session
    when '2'
      load_session
    else
      puts 'Invalid Selection'
      setup
    end
  end

  def play
    until @turn >= MAX_TURNS
      obtain_player_input
      p @turn += 1
    end
  end

  private

  # read in source file and load words 5-12 letters in length
  def create_word_bank
    @words = File.readlines('google-10000-english-no-swears.txt', chomp: true)
    @words.select! { |words| words.length >= 5 && words.length <= 12 }
  end

  def new_session
    @hidden_word = @words[rand(@words.length)]
  end

  def load_session
    # load player file
  end

  def save_session
    # save progress
  end

  def obtain_player_input
    guess = @player.input
    if check_input(guess)
      obtain_player_input
    else
      guess
    end
  end

  def check_input(input)
    if input.length > 1 || !input.match?(/[A-Za-z]/)
      puts 'Input must match 1 single letter!'
      true
    elsif input.downcase.match?(/[a-z]/)
      false
    end
  end
end
