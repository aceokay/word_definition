require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/description')
require('pry')
also_reload('/lib/**/*.rb')

get('/') do
  erb(:index)
end