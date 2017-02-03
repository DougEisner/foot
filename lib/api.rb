require 'sinatra'
require_relative 'models/player'
require_relative 'environment'

get '/api/players' do
  sort = params['sort'] || 'name'
  Player.order(sort).to_json
end

get '/api/players/:id' do |id|
  player = Player.find_by_id(id)
  if player.nil?
    [404, 'No player found']
  else
    player.to_json
  end
end

post '/api/players' do
  player = Player.create(name: params[:name], position: params[:position], healthy: params[:healthy]).to_json
end

#TRY to do this finding player by name, not id
patch '/api/players/:name/:position' do |name, position|
  player = Player.find_by(name: name)
  if player.nil?
    halt 404
  end
  player.update(position: position)
  player.to_json
end

delete '/api/players/:id' do |id|
  player = Player.find_by_id(id)
  player.destroy
end
