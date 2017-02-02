require 'rspec'
require 'models/player'
require 'test_environment'

describe Player do
  describe '#valid?' do
    context 'when given a name and position' do
      it 'returns true' do
        player = Player.new(name: 'Marshall', position: 'receiver')

        expect(player.valid?).to eq true
      end
    end
  end

  describe '#create' do
    it 'returns a Player object with an id and a team' do
      team = Team.create(name: 'Dolphins', division: 'AFC East')
      player = Player.create(name: 'Suh', position: 'defense', team_id: 1)

      expect(player.id > 0).to eq true
      expect(player.team_id).to eq 1
      expect(player.team.name).to eq 'Dolphins'
    end
  end
end
