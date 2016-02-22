require_relative "../game"

describe TicTacToe do
  let(:game) { TicTacToe.new }

  context "#initialize" do
    it "initializes the game with a board" do
      expect { TicTacToe.new(board: "board") }.to_not raise_error
    end
  end

    it "sets the grid with three rows by default" do
        board = Board.new
        expect(board.grid.size).to eq(3)
      end

    it "creates three things in each row by default" do
        board = Board.new
        board.grid.each do |row|
          expect(row.size).to eq(3)
        end
      end

  # describe '#create_board' do
  #   it "should create three cells in each row" do
  #     expect(game.create_board.size).to eq(3)
  #   end
  # end

  # describe '#create_board' do
  #   it "should return a blank board" do
  #     expect(game.create_board).to eq(true)
  #   end
  # end
end