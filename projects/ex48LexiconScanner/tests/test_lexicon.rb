require "ex48/lexicon.rb"
require "test/unit"

class TestLexicon < Test::Unit::TestCase
  
  def test_directions()
    assert_equal([['direction', 'north']], Lexicon.scan("north"))
    result = Lexicon.scan("north south east")

    assert_equal([['direction', 'north'],
           ['direction', 'south'],
           ['direction', 'east']], result)
  end
  
  def test_verbs()
    assert_equal([['verb', 'go']], Lexicon.scan("go"))
    result = Lexicon.scan("go kill eat")
    assert_equal([['verb', 'go'],
           ['verb', 'kill'],
           ['verb', 'eat']], result)
  end
  
  def test_stops()
    assert_equal(Lexicon.scan("the"), [['stop', 'the']])
    result = Lexicon.scan("the in of")
    assert_equal(result, [['stop', 'the'],
           ['stop', 'in'],
           ['stop', 'of']])
  end


  def test_nouns()
    assert_equal(Lexicon.scan("bear"), [['noun', 'bear']])
    result = Lexicon.scan("bear princess")
    assert_equal(result, [['noun', 'bear'],
           ['noun', 'princess']])
  end

  def test_numbers()
    assert_equal(Lexicon.scan("1234"), [['number', 1234]])
    result = Lexicon.scan("3 91234")
    assert_equal(result, [['number', 3],
           ['number', 91234]])
  end


  def test_errors()
    assert_equal(Lexicon.scan("ASDFADFASDF"), [['error', 'ASDFADFASDF']])
    result = Lexicon.scan("bear IAS princess 39th bear2")
    assert_equal(result, [['noun', 'bear'],
           ['error', 'IAS'],
           ['noun', 'princess'],
           ['error', '39th'],
           ['error', 'bear2']])
  end
  
  def test_letter_cases()
    assert_equal([['direction', 'north']], Lexicon.scan("North"))
    result = Lexicon.scan("North SOUTH east")

    assert_equal([['direction', 'north'],
           ['direction', 'south'],
           ['direction', 'east']], result)
  end
  
  def test_long_sentence()
    result = Lexicon.scan("open the door and smack the bear in the nose")
    expected = [["error", "open"], ["stop", "the"], ["noun", "door"], ["error", "and"], ["error", "smack"], ["stop", "the"], ["noun", "bear"], ["stop", "in"], ["stop", "the"], ["error", "nose"]]
    assert_equal(expected, result)
  end

end