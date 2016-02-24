class TicTacToe
  X_MARK = "X"
  O_MARK = "O"
  WIN_COMBOS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  attr_accessor :board

  def initialize
    @board = [" "] * 9
  end

  def create_board
    puts ""
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts ""
  end

  def start
    puts "Instructions: Please enter a number between 1 - 9 for the corresponding cells blow."
    puts ""
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
    puts ""
    start_game
    show_results
  end

  def start_game
    9.times do
      computer_turn
      create_board
      break if winner(X_MARK) || winner(O_MARK) || cats_game
      player_turn
      break if winner(X_MARK) || winner(O_MARK) || cats_game
    end
  end

  def show_results
    if cats_game
      puts "Cats game. It's a tie."
    elsif winner(O_MARK)
      puts "'O' player wins!!"
    else
      puts "'X' player wins!!"
    end
    create_board
  end

  def computer_turn
    turn = find_computer_turn
    update_board(turn, O_MARK)
  end

  def player_turn
    puts "Please enter a number between 1 - 9"
    turn = gets.to_i - 1
    if check_num(turn)
      update_board(turn, X_MARK)
    else
      puts "Number is invalid or already taken. Please enter another number."
      create_board
      player_turn
    end
  end

  def find_computer_turn
    WIN_COMBOS.each do |row|
      if count_rows(row, O_MARK) == 2
        return empty_cell(row)
      end
    end
    WIN_COMBOS.each do |row|
      if count_rows(row, X_MARK) == 2
        return empty_cell(row)
      end
    end
    WIN_COMBOS.each do |row|
      if count_rows(row, O_MARK) == 1
        return empty_cell(row)
      end
    end
    WIN_COMBOS.each do |row|
      if count_rows(row, X_MARK) == 1
        return empty_cell(row)
      end
    end
    @board.each_index do |cell|
      if @board[cell] == " "
        return cell
      end
    end
  end

  def update_board(move, player)
    @board[move] = player
  end

  def check_num(turn)
    turn.between?(0, 8) && @board[turn] == " "
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
    WIN_COMBOS.any? do |cell1, cell2, cell3|
      [letter, letter, letter] == [@board[cell1], @board[cell2], @board[cell3]]
    end
  end

  def cats_game
    !winner(X_MARK) && !winner(O_MARK) && @board.none? { |cell| cell == " " }
  end
end

game = TicTacToe.new
game.start
