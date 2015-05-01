class Word

  attr_reader(:word, :definition)

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @definition = attributes.fetch(:definition)
  end
end
