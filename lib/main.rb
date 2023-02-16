# frozen_string_literal: true

require './lib/hangman'

hangman = Hangman.new
hangman.setup
puts hangman.hidden_word
hangman.play
