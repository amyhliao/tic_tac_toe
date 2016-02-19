class TicTacToe
  attr_accessor :board, :win_combos

  def initialize
    @board = [" "] * 9
    @win_combos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  end

  def create_board
    puts "_____________"
    puts "| #{@board[0]} | #{@board[1]} | #{@board[2]} |"
    puts "_____________"
    puts "| #{@board[3]} | #{@board[4]} | #{@board[5]} |"
    puts "_____________"
    puts "| #{@board[6]} | #{@board[7]} | #{@board[8]} |"
    puts "-------------"
  end

  def start
    puts "Instructions: Please enter a number between 1 - 9 for the corresponding cells blow."
    puts "_____________",
         "| 1 | 2 | 3 |",
         "_____________",
         "| 4 | 5 | 6 |",
         "_____________",
         "| 7 | 8 | 9 |",
         "_____________",
         "********************"
    start_game
    show_results
  end

  def start_game
    9.times do
      computer_turn
      create_board
      break if winner("X") || winner("O") || cats_game
      player_turn
      break if winner("X") || winner("O") || cats_game
    end
  end

  def show_results
    if cats_game
      puts "Cats game. It's a tie."
    elsif winner("O")
      puts "'O' wins!!"
    else
      puts "'X' wins!!"
    end
    create_board
  end

  def player_turn
    puts "Please enter a number between 1 - 9"
    turn = gets.chomp.to_i - 1
    if check_num(turn)
      update_board(turn, "X")
    else
      puts "Cell taken. Please enter another number."
      create_board
      player_turn
    end
  end

  def check_num(turn)
    turn.between?(0, 8) && @board[turn] == " "
  end

  def update_board(move, player)
    @board[move] = player
  end

  def computer_turn
    turn = find_computer_turn
    update_board(turn, "O")
  end

  def find_computer_turn
    @win_combos.each do |row|
      if count_rows(row, "O") == 2
        return empty_cell(row)
      end
    end
    @win_combos.each do |row|
      if count_rows(row, "X") == 2
        return empty_cell(row)
      end
    end
    @win_combos.each do |row|
      if count_rows(row, "O") == 1
        return empty_cell(row)
      end
    end
    @win_combos.each do |row|
      if count_rows(row, "X") == 1
        return empty_cell(row)
      end
    end
    @board.each_index do |cell|
      if @board[cell] == " "
        return cell
      end
    end
  end

  def count_rows(row, player)
    total = 0
    row.each do |index|
      total += 1 if @board[index] == player
      if @board[index] != player && @board[index] != " "
        return 0
      end
    end
    total
  end

  def empty_cell(row)
    row.find { |index| @board[index] == " "}
  end


  def winner(letter)
    @win_combos.any? do |cell1, cell2, cell3|
      [letter, letter, letter] == [@board[cell1], @board[cell2], @board[cell3]]
    end
  end

  def cats_game
    !winner("X") && !winner("O") && @board.none? { |cell| cell == " " }
  end
end

game = TicTacToe.new
game.start

# require 'set'

# module TicTacToe
#   WIN_PATTERN = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

#   class Game
#     def initialize(player_1_class, player_2_class)
#       @board = Array.new(10) # we ignore index 0 for convenience

#       @current_player_id = 0
#       @players = [player_1_class.new(self, "X"), player_2_class.new(self, "O")]
#       puts "#{current_player} goes first."
#     end
#     attr_reader :board, :current_player_id

#     def play
#       loop do
#         place_player_marker(current_player)

#         if player_has_won?(current_player)
#           puts "#{current_player} wins!"
#           print_board
#           return
#         elsif board_full?
#           puts "It's a draw."
#           print_board
#           return
#         end

#         switch_players!
#       end
#     end

#     def free_positions
#       Set.new((1..9).select {|position| @board[position].nil?})
#     end

#     def place_player_marker(player)
#       position = player.select_position!
#       puts "#{player} selects #{player.marker} position #{position}"
#       @board[position] = player.marker
#     end

#     def player_has_won?(player)
#       WIN_PATTERN.any? do |line|
#         line.all? {|position| @board[position] == player.marker}
#       end
#     end

#     def board_full?
#       free_positions.empty?
#     end

#     def other_player_id
#       1 - @current_player_id
#     end

#     def switch_players!
#       @current_player_id = other_player_id
#     end

#     def current_player
#       @players[current_player_id]
#     end

#     def opponent
#       @players[other_player_id]
#     end

#     def turn_num
#       10 - free_positions.size
#     end

#     def print_board
#       col_separator, row_separator = " | ", "--+---+--"
#       label_for_position = lambda{|position| @board[position] ? @board[position] : position}

#       row_for_display = lambda{|row| row.map(&label_for_position).join(col_separator)}
#       row_positions = [[1,2,3], [4,5,6], [7,8,9]]
#       rows_for_display = row_positions.map(&row_for_display)
#       puts rows_for_display.join("\n" + row_separator + "\n")
#     end
#   end

#   class Player
#     def initialize(game, marker)
#       @game = game
#       @marker = marker
#     end
#     attr_reader :marker
#   end

#   class HumanPlayer < Player
#     def select_position!
#       @game.print_board
#       loop do
#         print "Select your #{marker} position: "
#         selection = gets.to_i
#         return selection if @game.free_positions.include?(selection)
#         puts "Position #{selection} is not available. Try again."
#       end
#     end

#     def to_s
#       "Human"
#     end
#   end

#   class ComputerPlayer < Player
#     DEBUG = false # edit this line if necessary

#     def group_positions_by_markers(line)
#       markers = line.group_by {|position| @game.board[position]}
#       markers.default = []
#       markers
#     end

#     def select_position!
#       opponent_marker = @game.opponent.marker

#       winning_or_blocking_position = look_for_winning_or_blocking_position(opponent_marker)
#       return winning_or_blocking_position if winning_or_blocking_position

#       if corner_trap_defense_needed?
#         return corner_trap_defense_position(opponent_marker)
#       end

#       # could make this smarter by sometimes doing corner trap offense

#       return random_prioritized_position
#     end

#     def look_for_winning_or_blocking_position(opponent_marker)
#       for line in WIN_PATTERN
#         markers = group_positions_by_markers(line)
#         next if markers[nil].length != 1
#         if markers[self.marker].length == 2
#           log_debug "winning on line #{line.join}"
#           return markers[nil].first
#         elsif markers[opponent_marker].length == 2
#           log_debug "could block on line #{line.join}"
#           blocking_position = markers[nil].first
#         end
#       end
#       if blocking_position
#         log_debug "blocking at #{blocking_position}"
#         return blocking_position
#       end
#     end

#     def corner_trap_defense_needed?
#       corner_positions = [1, 3, 7, 9]
#       opponent_chose_a_corner = corner_positions.any?{|pos| @game.board[pos] != nil}
#       return @game.turn_num == 2 && opponent_chose_a_corner
#     end

#     def corner_trap_defense_position(opponent_marker)
#       # if you respond in the center or the opposite corner, the opponent can force you to lose
#       log_debug "defending against corner start by playing adjacent"
#       # playing in an adjacent corner could also be safe, but would require more logic later on
#       opponent_position = @game.board.find_index {|marker| marker == opponent_marker}
#       safe_responses = {1=>[2,4], 3=>[2,6], 7=>[4,8], 9=>[6,8]}
#       return safe_responses[opponent_position].sample
#     end

#     def random_prioritized_position
#       log_debug "picking random position, favoring center and then corners"
#       ([5] + [1,3,7,9].shuffle + [2,4,6,8].shuffle).find do |pos|
#         @game.free_positions.include?(pos)
#       end
#     end

#     def log_debug(message)
#       puts "#{self}: #{message}" if DEBUG
#     end

#     def to_s
#       "Computer#{@game.current_player_id}"
#     end
#   end
# end

# include TicTacToe

# players_with_human = [HumanPlayer, ComputerPlayer].shuffle
# Game.new(*players_with_human).play