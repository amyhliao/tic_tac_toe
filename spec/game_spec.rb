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

  describe '#start' do
    it "should have a new game start" do
      expect(game.start).not_to eq(0)
    end

    it "should print start with instructions" do
      # allow(game).to receive(:start)
      expected = "Instructions: Please enter a number between 1 - 9 for the corresponding cells blow."
      expect(game.start).to eq expected
      # expect(game.start).to start_with("Instructions")
    end
  end

  describe '#start_game' do
    it "should have the computer start the game with a move" do
      expect(game.start_game).to be nil
    end
  end

  # describe '#create_board' do
  #   it "should return a blank board" do
  #     expect(game.create_board).to eq(true)
  #   end
  # end

  describe "#start_game" do
      it "returns winner if winner is true" do
        # board = TicTacToe.new
        game.stub(:winner) { true }
        expect(game.start_game).to eq :winner
      end

      it "it returns :draw if winner? is false and draw? is true" do
        # board = TicTacToe.new
        game.stub(:winner) { false }
        game.stub(:cats_game) { true }
        expect(game.start_game).to eq :cats_game
      end

      it "returns false if winner? is false and draw? is false" do
        # board = TicTacToe.new
        game.stub(:winner) { false }
        game.stub(:cats_game) { false }
        expect(game.start_game).to eq false
      end
    end
end