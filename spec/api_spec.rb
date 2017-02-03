require 'rack/test'
require 'api'
require 'pry'
require 'test_environment'
require_relative '../lib/models/player'


describe 'api' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe '#get /api/players' do
    it 'returns all players' do
      # Arrange
      player = Player.create(name: 'Suh', position: 'DT')
      # Act
      get '/api/players'
      # Assert
      expect(JSON.parse(last_response.body).first['name']).to eq 'Suh'
    end
  end

  describe '#get /api/players/:id' do
    context "when a valid id is entered in named query url" do
      it 'returns a player' do
        player = Player.create(name: 'Suh', position: 'DT')
        get '/api/players/2'

        expect(JSON.parse(last_response.body)['id']).to eq 2
      end
    end

    context 'when an invalid id is entered' do
      it 'returns a 404 error' do
        get '/api/players/53'

        expect(last_response.status).to eq 404
      end
    end
  end

  describe '#get /api/players?sort' do
    context 'when a sort parameter is entered' do
      it 'returns all players sorted by parameter' do
        #Arrange
        player = Player.create(name: 'Suh', position: 'DT')
        player = Player.create(name: 'Tannehil', position: 'QB')
        player = Player.create(name: 'JJ Watt', position: 'OL')
        player = Player.create(name: 'Ditka', position: 'Linebacker')
        player = Player.create(name: 'Revis', position: 'Cornerback')
        player = Player.create(name: 'Abe', position: 'Wideout')
        #Act
        get '/api/players?sort=name'
        #Assert
        #binding.pry
        expect(JSON.parse(last_response.body).first['name']).to eq 'Abe'
      end
    end
  end

  describe '#post /api/players' do
    context 'when valid player info is entered' do
      it 'creates new player' do
        #Act
        post '/api/players?name=Eifert&position=TE&healthy=true'
        #Assert
        expect(JSON.parse(last_response.body)['name']).to eq 'Eifert'
      end
    end
  end

  #figure out how to identify player by name.
  describe '#patch /api/players/:name/:position' do
    context 'when a valid player name and new position is entered' do
      it 'updates the position' do
        #Arrange
        player = Player.create(name: 'Ditka', position: 'Linebacker')
        #Act
        patch '/api/players/Ditka/DL'
        #Assert
        binding.pry
        expect(JSON.parse(last_response.body)['position']).to eq 'DL'
      end
    end
  end

  describe '#delete /api/players/:id' do
    context 'when valid player id is given' do
      it 'deletes the player' do
        #Arrange
        player = Player.create(id: 1, name: 'Ditka', position: 'Linebacker')
        #Act
        delete '/api/players/1'
        expect(Player.find_by_id(1)).to eq nil
      end
    end
  end

end
