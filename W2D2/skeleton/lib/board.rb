require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){ Array.new }
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    cups.each_with_index do |cup, idx|
      unless idx == 6 || idx == 13
        4.times do
          cup << :stone
        end
      end
    end
  end

  def valid_move?(start_pos)
    if !start_pos.between?(0, 5) || !start_pos.between?(7, 12) || @cups[start_pos].empty?
      # return false
      raise "Invalid starting cup"
    end
    true
  end

  def make_move(start_pos, current_player_name)
    puts start_pos
    moves = cups[start_pos].count
    cups[start_pos].clear
    # debugger
    i = next_turn(start_pos)
    until moves == 0
      if i == 13 && current_player_name == @name1
        i = 0
      elsif i == 6 && current_player_name == @name2
        i += 1
      elsif i <= 13
        cups[i] << :stone
        i += 1
        moves -= 1
      else
        i -= 14
      end
    end
        # system('clear')
    render
    # debugger
    if current_player_name == @name1 && i - 1 == 6
      :prompt
    elsif current_player_name == @name2 && i - 1 == -1
      :prompt
    elsif cups[i - 1].count == 1
      :switch
    else
      i - 1
    end
  end

  def next_turn(ending_cup_idx)
    result = -1
    if ending_cup_idx < 13
      puts ending_cup_idx
      puts ending_cup_idx + 1
      result = ending_cup_idx + 1
    elsif ending_cup_idx == 13
      result = 0
    else
      puts "why ending_cup_idx goes over 13?!"
    end
    result
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[7..12].all?{ |cup| cup.empty? } || @cups.take(6).all?{ |cup| cup.empty? }
  end

  def winner
    case cups[13] <=> cups[6]
    when -1
      @name1
    when 1
      @name2
    else
     :draw
    end
  end
end
