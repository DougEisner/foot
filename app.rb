require 'active_record'
require 'yaml'
require 'sinatra'

database_config = YAML::load(File.open('config/database.yml'))

ActiveRecord::Base.establish_connection(database_config)

get '/:name?' do
  name = params[:name] || 'world'
  "Hello, #{name}!"
end
