# frozen_string_literal: true

require 'yaml'

# YAML methods to save and load game states
module Serialize
  def save(name)
    File.new("./saves/#{name}.yml", 'w') unless File.exist?(name)
    File.open("./saves/#{name}.yml", 'w') do |file|
      file.write(state)
    end
    puts "\nFile saved as #{name}"
  end

  def load_file(name)
    data = YAML.safe_load(File.read("./saves/#{name}"), permitted_classes: [Symbol])
    @round_name = data[:round_name]
    @hidden_word = data[:hidden_word]
    @tries = data[:tries]
    @letter_spots = data[:letter_spots]
    @wrong_letters = data[:wrong_letters]
  end

  def state
    YAML.dump(
      round_name: @round_name,
      hidden_word: @hidden_word,
      tries: @tries,
      letter_spots: @letter_spots,
      wrong_letters: @wrong_letters
    )
  end

  def saved_files
    files = {}
    Dir.children('./saves/').each_with_index { |file, index| files[index] = file }
    files
  end

  def choose_save
    puts "\nPlease select file by number: \n"
    saved_files.each_pair { |key, value| puts "#{key + 1}: #{value}" }
    input = gets.chomp
    @load = saved_files[input.to_i - 1]
    @load.nil? ? choose_save : @load
  end
end
