require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')

get('/') do
  @all_words = Word.all()
  erb(:index)
end

get('/add_word') do
  erb(:form)
end

post('/add_word')do

  word = params.fetch('word')
  part_of_speach = params.fetch('part_of_speach')
  definition = params.fetch('definition')
  new_definition = Definition.new({:part_of_speach => part_of_speach, :definition_read_out => definition})
  new_word = Word.new({:word => word})
  new_word.add_definition(new_definition)
  new_word.save()
  @all_words = Word.all()
  erb(:index)
end

get('/single_word/:id') do
  @word = Word.find(params.fetch('id').to_i()).word()
  @word_object = Word.find(params.fetch('id').to_i())
  @definition = Word.find(params.fetch('id').to_i()).definition()
  erb(:definition)
end

post('/add_definition/:id') do
  part_of_speach = params.fetch('part_of_speach')
  definition = params.fetch('definition')
  new_definition = Definition.new({:part_of_speach => part_of_speach, :definition_read_out => definition})
  @word_object = Word.find(params.fetch('id').to_i())
  @word_object.add_definition(new_definition)
  @definition = @word_object.definition()
  @word = @word_object.word()
  erb(:definition)
end
