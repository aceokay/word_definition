require('rspec')
require('word')

describe(Word) do
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

  describe('.all') do
    it('returns all saved instance items from the class Word') do
      expect(Word.all()).to(eq([]))
    end
  end
end
