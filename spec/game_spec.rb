require_relative "../game"

describe TicTacToe do
  let(:game) { TicTacToe.new }

  describe '#create_board' do
    it "should create three cells in each row" do
      game.create_board.each do |row|
        expect(row.size).to eq(3)
      end
    end
  end

  # describe '#create_board' do
  #   it "should return a blank board" do
  #     expect(game.create_board).to eq(true)
  #   end
  # end
end