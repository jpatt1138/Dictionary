require('rspec')
require('word')
require('definition')
require('pry')

describe(Word) do
  # before() do
  #   Word.clear()
  # end
  describe('#word') do
    it('returns input word') do
      test_word = Word.new({:word => "goblin", :definition => Definition.new({ :part_of_speach => "noun", :definition_read_out => "a small mischievieous creature"}) })
      expect(test_word.word()).to(eq("goblin"))
    end
  end

  describe ('.all') do
    it("returns all elements in the array of words") do
      expect(Word.all()).to(eq([]))
    end
  end

  # describe('#save') do
  #   it('takes a particular word and saves it in an array') do
  #     test_word = Word.new({:word => "goblin", :definition => Definition.new({ :part_of_speach => "noun", :definition_read_out => "a small mischievieous creature"}) })
  #     test_word.save()
  #
  #   end
  # end
end
