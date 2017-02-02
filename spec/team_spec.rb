require 'rspec'
require 'models/team'
require 'test_environment'

describe Team do
  describe '#valid' do
    context 'when a team has a name and division' do
      it 'returns true' do
        team = Team.new(name: 'Jets', division: 'AFC East')

        expect(team.valid?).to eq true
      end
    end

    context 'when a team has a name and but no division' do
      it 'returns false' do
        team = Team.new(name: 'Jets', division: '')

        expect(team.valid?).to eq false
      end
    end

    context 'when a team does not have a name and but has division' do
      it 'returns false' do
        team = Team.new(name: '', division: 'AFC East')

        expect(team.valid?).to eq false
      end
    end
  end

  describe '#create' do
    it 'returns a Team object with an id' do
      team = Team.create(name: 'Bills', division: 'AFC East')

      expect(team.id > 0).to eq true
    end
  end

  # describe '#victims' do
  #   it 'returns victims' do
  #     weapon = Weapon.create(name: 'Horse-Dagger', kind: 'melee')
  #     Victim.create(name: 'Bert', weapon: weapon)
  #     Victim.create(name: 'Bruce', weapon: weapon)
  #
  #     expect(weapon.victims.length).to eq 2
  #     expect(weapon.victims.first.name).to eq 'Bert'
  #     expect(weapon.victims.last.name).to eq 'Bruce'
  #   end
  # end

end
