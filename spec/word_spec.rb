require('rspec')
require('word')

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
end
