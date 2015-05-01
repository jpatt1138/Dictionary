class Word

  @@words = []

  attr_reader(:word, :definition)

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @definition = attributes.fetch(:definition)
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:clear) do
    @@words = []
  end
  
end
