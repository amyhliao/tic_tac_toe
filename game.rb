class TicTacToe
  attr_accessor :board, :win_patterns

  def initialize
    @board = [" "] * 9
    @win_patterns = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  end
end