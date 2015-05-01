require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  @all_words = Word.all()
  erb(:index)
end

get('/add_word') do
  erb(:definition)
end

post('/add_word')do
word = params.fetch('word')
part_of_speach = params.fetch('part_of_speach')
definition = params.fetch('definition')
Word.new({:word => word, :definition => Definition.new({:part_of_speach => part_of_speach, :definition_read_out => definition})}).save()
@all_words = Word.all()
erb(:index)
end
