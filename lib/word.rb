class Word

  @@words = []
  @@w_index = 0

  attr_reader(:word, :definition, :w_id)

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @definition = []
    @@w_index = @@w_index += 1
    @w_id = @@w_index
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:clear) do
    @@words = []
    @@w_index = 0
  end

  define_singleton_method(:find) do |id|
    found_word = nil
    @@words.each() do |word|
      if word.w_id() == id.to_i()
        found_word = word
      end
    end
    found_word
  end


end
