require('rspec')
require('word')
require('definition')

describe(Word) do
  before() do
    Word.clear()
  end

  describe('#word') do
    it('returns the word of the Word class instance') do
      test_word = Word.new({:word => 'mouse'})
      expect(test_word.word()).to(eq('mouse'))
    end
  end

  describe('#save') do
    it('saves a given instance of the Word class to the Word class array') do
      test_word = Word.new({:word => 'cheese'})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe('.clear') do
    it('destroys all saved instances within the class Word') do
      test_word = Word.new({:word => 'cheese'})
      test_word.save()
      expect(Word.clear()).to(eq([]))
    end
  end

  describe('.all') do
    it('returns all saved instance items from the class Word') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('returns the id of a given instance of the class Word') do
      test_word = Word.new({:word => 'love'})
      test_word.save()
      test_word2 = Word.new({:word => 'peace'})
      test_word2.save()
      test_word3 = Word.new({:word => 'happiness'})
      test_word3.save()
      expect(test_word2.id()).to(eq(2))
      expect(test_word3.id()).to(eq(3))
      expect(test_word.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('takes an word instance ID and returns the word instance') do
      test_word = Word.new({:word => 'earth'})
      test_word.save()
      test_word2 = Word.new({:word => 'wind'})
      test_word2.save()
      test_word3 = Word.new({:word => 'fire'})
      test_word3.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
      expect(Word.find(test_word2.id())).to(eq(test_word2))
      expect(Word.find(test_word3.id())).to(eq(test_word3))
    end
  end

  describe('#definitions') do
    it('returns all definitions instances of a given instance of the class Word') do
      test_word = Word.new({:word => 'moon'})
      test_word.save()
      expect(test_word.definitions()).to(eq([]))
    end

    # returns an empty array if empty, returns definition strings otherwise
  end

  describe('#add_definition') do
    it('saves multiple definitions of a word to one instance of Word') do
      test_word = Word.new({:word => 'egg'})
      test_word.save()
      test_word.add_definition(Definition.new({:definition => "A product of birds"}))
      test_word.add_definition(Definition.new({:definition => "A tasty treat"}))
      expect(test_word.definitions()).to(eq(["A product of birds","A tasty treat"]))
    end
  end
end
