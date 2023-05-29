require_relative '../lib/game'

describe Game do
  describe '#verify_input' do
    subject(:valid_input) { described_class.new }

    context 'when player input is valid' do
      it 'returns true' do
        input = 2
        result = valid_input.verify_input(input)
        expect(result).to eq(2)
      end
    end

    context 'when player input is already in use' do
      let(:game_board) { valid_input.instance_variable_get(:@board) }

      before do
        game_board.grid[0][2] = 'X'
      end

      it 'returns false' do
        invalid_input = 2
        result = valid_input.verify_input(invalid_input)
        expect(result).to be(false)
      end
    end

    context 'when player input not valid' do
      it 'returns false' do
        invalid_input != (1..7)
        result = valid_input.verify_input(invalid_input)
        expect(result).to be(false)
      end
    end
  end
end