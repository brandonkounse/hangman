# frozen_string_literal: true

require 'yaml'
require './lib/art'

# interface for player to interact with hangman game
class Hangman
  include Art

  MAX_TRIES = 7

  attr_reader :words, :hidden_word, :guess, :tries, :letter_spots, :wrong_letters, :art

  def initialize
    create_word_bank
    @letter_spots = []
    @wrong_letters = []
    @tries = 0
    @art = [stage, noose, head, torso, left_arm, right_arm, left_leg, right_leg]
  end

  def setup
    print 'Would you like to start a new game[1] or load[2] a previous game? '
    case gets.chomp
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
    until @tries >= MAX_TRIES || @hidden_word.match?(@letter_spots.join)
      info
      obtain_guess
      update
      @tries += 1 unless @hidden_word.include?(@guess)
    end
    info
    over
  end

  private

  # read in source file and load words 5-12 letters in length
  def create_word_bank
    @words = File.readlines('google-10000-english-no-swears.txt', chomp: true)
    @words.select! { |words| words.length >= 5 && words.length <= 12 }
  end

  def new_session
    @hidden_word = @words[rand(@words.length)]
    @hidden_word.length.times { @letter_spots.push('_') }
  end

  def load_session
    # load player file
  end

  def save_session
    # save progress
  end

  def obtain_guess
    print "\nPlease guess a letter: "
    input = gets.chomp
    if input_valid?(input)
      @guess = input
    else
      obtain_guess
    end
  end

  def input_valid?(input)
    if input.length > 1 || !input.match?(/[A-Za-z]/)
      puts 'Input must match 1 single letter!'
      false
    elsif input.downcase.match?(/[a-z]/)
      true
    end
  end

  def info
    puts "\n#{@art[@tries]}"
    puts "\nWrong letters: #{@wrong_letters}"
    puts @letter_spots.join(' ')
  end

  def update
    if @hidden_word.include?(@guess)
      @hidden_word.split('').each_with_index do |letter, index|
        @letter_spots[index] = @guess if letter.match?(@guess)
      end
    else
      @wrong_letters.push(@guess) unless @wrong_letters.include?(@guess)
    end
  end

  def over
    if @letter_spots.join.match?(@hidden_word)
      puts "\nYou saved yourself from a cruel fate!"
    else
      puts "\nQuit hanging around and try again!"
    end
  end
end
