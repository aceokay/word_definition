class Word
  attr_reader(:word)
  @@words = []

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @id = @@words.length() + 1
    @definition = []
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:all) do
    @@words
  end
end
