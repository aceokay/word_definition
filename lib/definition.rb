class Definition
  attr_reader(:definition, :id)
  @@definitions = []

  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
    @id = @@definitions.length() + 1
  end

  # define_method(:save) do
  #   @@words.push(self)
  # end
  #
  # define_singleton_method(:all) do
  #   @@words
  # end
  #
  # define_singleton_method(:clear) do
  #   @@words = []
  # end
  #
  # define_singleton_method(:find) do |id|
  #   @@words[id - 1]
  # end
end
