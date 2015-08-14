require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('/lib/**/*.rb')

get('/') do
  words = Word.all()
  @word_list_strings = []
  words.each() do |word|
    @word_list_strings.push(word.word())
  end
  if words.length() < 1
    help_message = "There aren't any words yet! Help us out and put some in!"
    @word_list_strings.push(help_message)
  end
  erb(:index)
end
