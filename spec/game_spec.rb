require_relative "../game"

describe TicTacToe do
  let(:game) { TicTacToe.new }

  describe '#create_board' do
    it "should return a blank board" do
      expect(game.create_board).to eq(0)
    end
  end
end