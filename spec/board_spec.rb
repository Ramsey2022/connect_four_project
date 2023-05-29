require_relative '../lib/board'

describe Board do
  let(:yellow_circle) { described_class.new.yellow_circle }
  let(:blue_circle) { described_class.new.blue_circle }

  describe '#update_board' do
    subject(:board_update) { Board.new }

    context 'when 1st row and 1st column updated with yellow circle' do
      before do
        board_update.update_board(1, 1, yellow_circle)
      end

      it 'updates cell on board' do
        board = board_update.instance_variable_get(:@grid)
        updated_cell = board[1][1]
        expect(updated_cell).to eq(yellow_circle)
      end
    end

    context 'when 6th row and 1st column updated with blue circle' do
      before do
        board_update.update_board(5, 0, blue_circle)
      end

      it 'updates cell on board' do
        board = board_update.instance_variable_get(:@grid)
        updated_cell = board[5][0]
        expect(updated_cell).to eq(blue_circle)
      end
    end
  end

  describe '#check_horizontal' do
    
  end
end