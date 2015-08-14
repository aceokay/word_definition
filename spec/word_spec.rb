require('rspec')
require('word')

describe(Word) do
  describe('#word') do
    it('returns the word of the Word class instance') do
      test_word = Word.new({:word => 'mouse'})
      expect(test_word.word()).to(eq('mouse'))
    end
  end

end
