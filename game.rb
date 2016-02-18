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
    puts "Instructions: Please enter a number between 1 - 9 for the corresponding cells."
    puts "_____________",
         "| 1 | 2 | 3 |",
         "_____________",
         "| 4 | 5 | 6 |",
         "_____________",
         "| 7 | 8 | 9 |",
         "_____________"
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
    else cats_game
      puts "'X' wins!!"
  end
  create_board

  def player_turn
    # puts "Please enter a number between 1 - 9"
    turn = gets.chomp.to_i
    if check_num turn
      update_board(turn, "X")
    else
      puts "Please enter another number."
      create_board
      player_turn
    end
  end

  def check_num(turn)
    turn.between?(0, 8) && @board[turn] == " "
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

  def count_rows(row, user)
    total = 0
    row.each do |index|
      total += 1 if @board[index] == user
      unless @board[index] == user or @board[index] == " "
        return 0
      end
    end
    total
  end

  def empty_cell(row)
    row.each do |index|
      return index if @board[index] == " "
    end
  end

  def update_board(move, user)
    @board[move] = user
  end


end

game = TicTacToe.new
game.start