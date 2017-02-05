require 'sinatra'

get '/:name?' do
  name = params[:name] || 'world'
  "Hello, #{name}!"
end
