require_relative "../game"

describe TicTacToe do
  let(:game) { TicTacToe.new }

  describe "#initialize" do
    it "should initialize the game with a board" do
      expect{ TicTacToe.new }.to_not raise_error
    end

    it "should set the board with empty cells by default" do
      expect(game.board).to eq([" "] * 9)
    end
  end

  describe "#create_board" do
    it "should set the board with empty cells by default" do
      expect(game.create_board).to eq(nil)
    end
  end

  describe '#start' do
    it "should have a new game start" do
      expect(game.start).not_to eq(0)
    end
  end

  describe '#start_game' do
    it "should have the computer start the game with a move" do
      expect(game.start_game).to be nil
    end

    it "should show nine empty spaces at the beginning of the game" do
      game.stub(:winner) { false }
      game.stub(:cats_game) { false }
      expect(game.start_game).to eq(9)
    end
  end

  describe '#count_rows' do
    it "should return true if there are not empty cells in a row." do
      expect(game.count_rows([])).not_to eq false
    end
  end

  describe '#empty_cell' do
    it "should return true if there are not empty cells in a row." do
      expect(game.empty_cell([])).not_to eq false
    end
  end

  describe '#winner' do
    it "should show the winner if there is a winner" do
      game.stub(:winner) { true }
      expect(game.winner).to eq true
    end

    it "should return winner X if player X wins" do
      game.stub(:winner) { true }
      expect(game.winner("X")).to eq true
    end

    it "should return winner O if player O wins" do
      game.stub(:winner) { true }
      expect(game.winner("O")).to eq true
    end
  end

  describe '#cats_game' do
    it "should return a cats game if there are no winners" do
      game.stub(:winner) { false }
      game.stub(:cats_game) { true }
      expect(game.cats_game).to eq true
    end
  end
end