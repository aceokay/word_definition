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
    @word_list_strings.push([word.word(), word.id()])
  end
  if words.length() < 1
    help_message = "There aren't any words yet! Help us out and put some in!"
    @word_list_strings.push([help_message, 00])
  end
  erb(:index)
end

post('/') do
  new_word = params.fetch('word')
  new_definition = params.fetch('definition')
  new_word_instance = Word.new({:word => new_word})
  new_word_instance.save()
  new_definition_instance = Definition.new({:definition => new_definition})
  new_word_instance.add_definition(new_definition_instance)
  words = Word.all()
  @word_list_strings = []
  words.each() do |word|
    @word_list_strings.push(word.word())
  end
  erb(:index)
end

get('/words/new') do
  erb(:word_form)
end

get('/words/00') do
  words = Word.all()
  @word_list_strings = []
  words.each() do |word|
    @word_list_strings.push([word.word(), word.id()])
  end
  if words.length() < 1
    help_message = "There aren't any words yet! Help us out and put some in!"
    @word_list_strings.push([help_message, 00])
  end
  erb(:index)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id'.to_id()))
  erb(:word_info)
end
