require 'colorize'

class BoardCase
  attr_accessor :contains
  def initialize(name)
    @contains = name
  end

  def give_to_player1
    @contains = 'X'
  end

  def give_to_player2
    @contains = 'O'
  end

  def print_center_line
    if @contains == 'X'
      self.contains.center(13).colorize(:red).colorize(:background => :white)
    elsif @contains == 'O'
      "#{self.contains}     #{self.contains}".center(13).colorize(:blue).colorize(:background => :white)
    else
      self.contains.center(13).colorize(:black).colorize(:background => :white)
    end
  end

  def print_ext_line
    if @contains == 'X'
      "#{self.contains} #{self.contains}".center(13).colorize(:red).colorize(:background => :white)
    elsif @contains == 'O'
      "#{self.contains}     #{self.contains}".center(13).colorize(:blue).colorize(:background => :white)
    else
      ' '.center(13).colorize(:black).colorize(:background => :white)
    end
  end

  def print_out_line
    if @contains == 'X'
      "#{self.contains}   #{self.contains}".center(13).colorize(:red).colorize(:background => :white)
    elsif @contains == 'O'
      "#{self.contains} #{self.contains}".center(13).colorize(:blue).colorize(:background => :white)
    else
      ' '.center(13).colorize(:black).colorize(:background => :white)
    end
  end
end

class Board
  attr_accessor :A1, :A2, :A3, :B1, :B2, :B3, :C1, :C2, :C3, :case_array
  def initialize
    @A1 = BoardCase.new('A1')
    @A2 = BoardCase.new('A2')
    @A3 = BoardCase.new('A3')
    @B1 = BoardCase.new('B1')
    @B2 = BoardCase.new('B2')
    @B3 = BoardCase.new('B3')
    @C1 = BoardCase.new('C1')
    @C2 = BoardCase.new('C2')
    @C3 = BoardCase.new('C3')
    @case_array = [@A1, @A2, @A3, @B1, @B2, @B3, @C1, @C2, @C3]
  end

  def printer
    system('clear')
    puts '             |             |             '.colorize(:black).colorize(:background => :white)
    puts @A1.print_out_line + '|'.colorize(:black).colorize(:background => :white) + @A2.print_out_line + '|'.colorize(:black).colorize(:background => :white) + @A3.print_out_line
    puts @A1.print_ext_line + '|'.colorize(:black).colorize(:background => :white) + @A2.print_ext_line + '|'.colorize(:black).colorize(:background => :white) + @A3.print_ext_line
    puts @A1.print_center_line + '|'.colorize(:black).colorize(:background => :white) + @A2.print_center_line + '|'.colorize(:black).colorize(:background => :white) + @A3.print_center_line
    puts @A1.print_ext_line + '|'.colorize(:black).colorize(:background => :white) + @A2.print_ext_line + '|'.colorize(:black).colorize(:background => :white) + @A3.print_ext_line
    puts @A1.print_out_line + '|'.colorize(:black).colorize(:background => :white) + @A2.print_out_line + '|'.colorize(:black).colorize(:background => :white) + @A3.print_out_line
    puts '-------------|-------------|-------------'.colorize(:black).colorize(:background => :white)
    puts @B1.print_out_line + '|'.colorize(:black).colorize(:background => :white) + @B2.print_out_line + '|'.colorize(:black).colorize(:background => :white) + @B3.print_out_line
    puts @B1.print_ext_line + '|'.colorize(:black).colorize(:background => :white) + @B2.print_ext_line + '|'.colorize(:black).colorize(:background => :white) + @B3.print_ext_line
    puts @B1.print_center_line + '|'.colorize(:black).colorize(:background => :white) + @B2.print_center_line + '|'.colorize(:black).colorize(:background => :white) + @B3.print_center_line
    puts @B1.print_ext_line + '|'.colorize(:black).colorize(:background => :white) + @B2.print_ext_line + '|'.colorize(:black).colorize(:background => :white) + @B3.print_ext_line
    puts @B1.print_out_line + '|'.colorize(:black).colorize(:background => :white) + @B2.print_out_line + '|'.colorize(:black).colorize(:background => :white) + @B3.print_out_line
    puts '-------------|-------------|-------------'.colorize(:black).colorize(:background => :white)
    puts @C1.print_out_line + '|'.colorize(:black).colorize(:background => :white) + @C2.print_out_line + '|'.colorize(:black).colorize(:background => :white) + @C3.print_out_line
    puts @C1.print_ext_line + '|'.colorize(:black).colorize(:background => :white) + @C2.print_ext_line + '|'.colorize(:black).colorize(:background => :white) + @C3.print_ext_line
    puts @C1.print_center_line + '|'.colorize(:black).colorize(:background => :white) + @C2.print_center_line + '|'.colorize(:black).colorize(:background => :white) + @C3.print_center_line
    puts @C1.print_ext_line + '|'.colorize(:black).colorize(:background => :white) + @C2.print_ext_line + '|'.colorize(:black).colorize(:background => :white) + @C3.print_ext_line
    puts @C1.print_out_line + '|'.colorize(:black).colorize(:background => :white) + @C2.print_out_line + '|'.colorize(:black).colorize(:background => :white) + @C3.print_out_line
    puts '             |             |             '.colorize(:black).colorize(:background => :white)
  end

  def give_board_player1(input)
    i = 0
    @case_array.each do
      g = @case_array[i].contains
      input = @case_array[i] if g == input
      i += 1
    end
    x = input.contains
    input.give_to_player1
    x
  end

  def give_board_player2(input)
    i = 0
    @case_array.each do
      g = @case_array[i].contains
      input = @case_array[i] if g == input
      i += 1
    end
    x = input.contains
    input.give_to_player2
    x
  end
end

class Player
  attr_accessor :name, :array_player
  def initialize(name)
    @name = name
    @array_player = []
  end

  def show_name
    @name
  end

  def pusher(contains)
    @array_player.push(contains)
  end
end

class Game
  attr_accessor :turn_counter, :board, :player1, :player2
  def initialize
    c = 1
    loop do
      @@win = 'draw'
      @@turn_counter = 0
      puts "What's the first player's name ?"
      print '>'
      x = gets.chomp
      @@player1 = Player.new(x)
      puts "What's the second player's name ?"
      print '>'
      x = gets.chomp
      @@player2 = Player.new(x)
      @@board = Board.new
      @@board.printer
      9.times do
        Game.play_a_turn
        @@board.printer
        if @@win == 'J1'
          puts "#{@@player1.show_name} wins !"
          break
        elsif @@win == 'J2'
          puts "#{@@player2.show_name} wins !"
          break
        end
      end
      puts "It's a draw !" if @@win == 'draw'
      puts
      puts 'Play Again ? [Y/N]'
      yes_no = gets.chomp.capitalize
      if yes_no == 'Y'
      elsif yes_no == 'N'
        puts "You played #{c} game"
        break
      else
        puts 'Error, game will start again in 5s'
        sleep(5)
      end
      puts
      c += 1
      puts "This is game #{c}"
    end
  end

  def self.play_a_turn
    pos_arr = %w[A1 A2 A3 B1 B2 B3 C1 C2 C3]
    if @@turn_counter.even? == true
      puts "It's #{@@player1.show_name}'s turn to play, you are X"
      loop do
        input = gets.chomp
        if @@player1.array_player.include?(input) == true ||
           @@player2.array_player.include?(input) == true ||
           pos_arr.include?(input) == false
          puts 'Error, choose another spot'
        else
          @@player1.pusher(@@board.give_board_player1(input))
          break
        end
      end
      @@win = 'J1' if Game.check_victory(@@player1.array_player) == true
    elsif @@turn_counter.even? == false
      puts "It's #{@@player2.show_name}'s turn to play, you are O"
      loop do
        input = gets.chomp
        if @@player1.array_player.include?(input) == true ||
           @@player2.array_player.include?(input) == true ||
           pos_arr.include?(input) == false
          puts 'Error, choose another spot'
        else
          @@player2.pusher(@@board.give_board_player2(input))
          break
        end
      end
      @@win = 'J2' if Game.check_victory(@@player2.array_player) == true
    end
    @@turn_counter += 1
  end

  def self.check_victory(array)
    arr = %w[A B C 1 2 3]
    if array.include?('A1') &&
       array.include?('B2') &&
       array.include?('C3')
      return true
    elsif array.include?('A3') &&
          array.include?('B2') &&
          array.include?('C1')
      return true
    end

    arr.each do |k|
      @c = 0
      array.each do |l|
        if l =~ /#{k}/
          @c += 1
          return true if @c == 3
        end
      end
    end
  end
end

Game.new
