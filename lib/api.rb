require 'active_record'
require 'yaml'
require 'sinatra'
require_relative 'models/player'

database_config = ENV['DATABASE_URL']
if database_config.blank?
  database_config = YAML::load(File.open('config/database.yml'))
end

ActiveRecord::Base.establish_connection(database_config)


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
