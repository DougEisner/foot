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

  describe '# get /api/players?sort' do
    context 'when a sort parameter is entered' do
      it 'returns players sorted by parameter' do

      end
    end
  end


end
