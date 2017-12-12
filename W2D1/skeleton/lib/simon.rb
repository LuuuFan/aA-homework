require 'byebug'
# require 'colorize'

# puts "This is blue text on red".blue.on_red

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play
    while !game_over
      input_seq = take_turn
      if @seq.map{|c| c[0].upcase}.join == input_seq
        take_turn
      else
        game_over = true
      end
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    # debugger
    round_success_message
    @sequence_length += 1
    input_seq = require_sequence
  end

  def show_sequence
    sleep(1)
    add_random_color
    @seq.each do |c|
      p "#{c.capitalize}"
      # .colorize(:color => c.to_sym)
      sleep(1)
      system('clear')
    end
  end

  def require_sequence
    p "Please insput the sequence color, e.g 'B' for blue, 'R' for Red, 'G' for Green, 'Y' for Yellow"
    input = gets.chomp.upcase
  end

  def add_random_color
    @seq << Simon::COLORS.sample
    @sequence_length = @seq.length
  end

  def round_success_message
      p "You got all correct number"
  end

  def game_over_message
    p "Wrong sequence color, you lose!"
  end

  def reset_game
    initialize
    # @seq = []
    # @sequence_length = 1
    # @game_over = false
    # puts 'y/n to replay the game'
    # input = gets.chomp.downcase
    # if input == 'y'
    #   play
    # end
  end
end

# a = Simon.new()
# a.play