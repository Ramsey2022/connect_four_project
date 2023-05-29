require_relative '../lib/game'

describe Game do
  describe '#verify_input' do
    subject(:valid_input) { described_class.new }

    context 'when player input is valid' do
      it 'returns true' do
        input = 2
        result = valid_input.verify_input(input)
        expect(result).to be(true)
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

    context 'when player input greater than 7' do
      it 'returns false' do
        invalid_input = 8
        result = valid_input.verify_input(invalid_input)
        expect(result).to be(false)
      end
    end

    context 'when player input less than 1' do
      it 'returns false' do
        invalid_input = -2
        result = valid_input.verify_input(invalid_input)
        expect(result).to be(false)
      end
    end
  end

  describe '#player_turn' do
    subject(:verify_turn) { described_class.new }
    let(:player1) { verify_turn.instance_variable_get(:@player1) }
    let(:player2) { verify_turn.instance_variable_get(:@player2) }

    before do
      player1.name = 'Jeff'
      player2.name = 'Sarah'
    end

    context 'when it is player1 turn' do
      it 'returns player1' do
        return_player = verify_turn.player_turn
        expect(return_player.name).to eq(player1.name)
      end
    end

    context 'when it is player2 turn' do
      before do
        verify_turn.instance_variable_set(:@turn, 1)
      end

      it 'returns player2' do
        return_player = verify_turn.player_turn
        expect(return_player.name).to eq(player2.name)
      end
    end
  end

  describe '#game_over?' do
    context 'when a player wins' do
      subject(:end_game) { described_class.new }
      let(:board) { end_game.instance_variable_get(:@board) }
      let(:player) { instance_double(Player, name: 'Jeff', symbol: 'X') }

      before do
        allow(board).to receive(:check_row).and_return(true)
      end

      it 'announces winner' do
        expect(end_game).to receive(:puts).with('Victory! Jeff wins!')
        end_game.game_over?(player)
      end
    end
  end

  describe '#tie' do
    subject(:game_tie) { described_class.new }

    context 'when tie' do
      before do
        game_tie.instance_variable_set(:@turn, 42)
      end
      it 'announces tie' do
        expect(game_tie).to receive(:puts).with("It's a tie! Try again.")
        game_tie.tie?
      end
    end
  end
end