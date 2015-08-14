require('rspec')
require('definition')

describe(Definition) do
  # before() do
  #   Definition.clear()
  # end

  describe('#definition') do
    it('returns the definition of the Definition class instance') do
      test_definition = Definition.new({:definition => 'A small rodent'})
      expect(test_definition.definition()).to(eq('A small rodent'))
    end
  end

  describe('#save') do
    it('saves a given instance of the Definition class to the Definition class array') do
      test_definition = Definition.new({:definition => 'A dairy product consisting of fat'})
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end

  describe('.clear') do
    it('destroys all saved instances within the class Definition') do
      test_definition = Definition.new({:definition => 'A dairy product consisting of fat'})
      test_definition.save()
      expect(Definition.clear()).to(eq([]))
    end
  end

  describe('.all') do
    it('returns all saved instance items from the class Definition') do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('returns the id of a given instance of the class Definition') do
      test_definition = Definition.new({:definition => 'love'})
      test_definition.save()
      test_definition2 = Definition.new({:definition => 'peace'})
      test_definition2.save()
      test_definition3 = Definition.new({:definition => 'happiness'})
      test_definition3.save()
      expect(test_definition2.id()).to(eq(2))
      expect(test_definition3.id()).to(eq(3))
      expect(test_definition.id()).to(eq(1))
    end
  end

  # describe('.find') do
  #   it('takes an word instance ID and returns the word instance') do
  #     test_word = Word.new({:word => 'earth'})
  #     test_word.save()
  #     test_word2 = Word.new({:word => 'wind'})
  #     test_word2.save()
  #     test_word3 = Word.new({:word => 'fire'})
  #     test_word3.save()
  #     expect(Word.find(test_word.id())).to(eq(test_word))
  #     expect(Word.find(test_word2.id())).to(eq(test_word2))
  #     expect(Word.find(test_word3.id())).to(eq(test_word3))
  #   end
  # end
end
