require('rspec')
require('word')
require('definition')
require('pry')

describe(Word) do
  before() do
    Word.clear()
  end
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


  describe('#save') do
    it('takes a particular word and saves it in an array') do
      test_word = Word.new({:word => "goblin", :definition => Definition.new({ :part_of_speach => "noun", :definition_read_out => "a small mischievieous creature"}) })
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe('.clear') do
    it('clears out container array of words') do
      test_word = Word.new({:word => "goblin", :definition => Definition.new({ :part_of_speach => "noun", :definition_read_out => "a small mischievieous creature"}) })
      test_word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a particular word based on its id number') do
      test_word = Word.new({:word => "goblin", :definition => Definition.new({ :part_of_speach => "noun", :definition_read_out => "a small mischievieous creature"}) })
      test_word.save()
      expect(Word.find(1)).to(eq(test_word))
    end
  end

  describe('add_definition') do
    it('takes a definition and adds it to a word') do
      test_definition = Definition.new({:part_of_speach => "v.", :definition_read_out => "singer of songs"})
      test_word = Word.new({:word => "something"})
      test_word.add_definition(test_definition)
      expect(test_word.definition()[0]).to(eq(test_definition))
    end
  end
end
