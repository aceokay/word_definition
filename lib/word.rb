class Word
  attr_reader(:word, :id)
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

  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end

  define_method(:definitions) do
    definition_strings = []
    if @definitions.length() > 0
      @definitions.each() do |definition|
        definition_strings.push(definition.definition())
      end
    end
    definition_strings
  end
end
