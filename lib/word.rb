class Word
  attr_reader(:word, :id, :definitions)
  @@words = []

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @id = @@words.length() + 1
    @definitions = []
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:all) do
    @@words
  end

  define_singleton_method(:clear) do
    @@words = []
  end

  define_singleton_method(:find) do |id|
    @@words[id - 1]
  end
end
