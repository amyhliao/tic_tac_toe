require_relative "../game"

describe TicTacToe do
  let(:game) { TicTacToe.new }

  describe "#initialize" do
    it "initializes the game with a board" do
      expect{ TicTacToe.new }.to_not raise_error
    end
    # it "sets the grid with three rows by default" do
    #   board = TicTacToe.new
    #   expect(board.count).to eq(3)
    # end
    # it "creates three things in each row by default" do
    #   board = TicTacToe.new
    #   board.grid.each do |row|
    #     expect(row.size).to eq(3)
    #   end
    # end
  end

  describe '#start_game' do
    it "should have the computer start the game with a move" do
      expect(game.start_game).to eq(0)
    end
  end

  # describe '#create_board' do
  #   it "should return a blank board" do
  #     expect(game.create_board).to eq(true)
  #   end
  # end
end