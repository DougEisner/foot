require 'sinatra'
require_relative 'models/player'
require_relative 'environment'

get '/api/players' do
  players = Player.all

  players.order('name desc').to_json
end

get '/api/players/:id' do |id|
  player = Player.find_by_id(id)
  if player.nil?
    [404, 'No player found']
  else
    player.to_json
  end
end
