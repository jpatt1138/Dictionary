require('rspec')
require('dictionary')
require('word')
require('definition')
require('pry')

describe(Word) do
  # before() do
  #   Word.clear()
  # end
  describe('#word') do
    it('returns input word') do
      test_word = Word.new({:word => "goblin", :definition => Definition.new({ :part_of_speach => "noun", :definition => "a small mischievieous creature"}) })
      expect(test_word.word()).to(eq("goblin"))
    end
  end
end
