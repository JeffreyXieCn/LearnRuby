require 'ex48/parser.rb'
require 'test/unit'

class TestParser < Test::Unit::TestCase
  def test_valid_setence()
    sentence = [['verb', 'run'], ['direction', 'north']]
    result = parse_sentence(sentence)
    assert_equal('player', result.subject)
    assert_equal('run', result.verb)
    assert_equal('north', result.object)
  end
  
  def test_valid_setence_with_stops()
    sentence = [['stop', 'the'], ['noun', 'bear'], ['verb', 'run'], ['stop', 'to'], ['stop', 'the'], ['direction', 'north']]
    result = parse_sentence(sentence)
    assert_equal('bear', result.subject)
    assert_equal('run', result.verb)
    assert_equal('north', result.object)
  end
  
  def test_invalid_sentence()
    sentence = sentence = [['noun', 'bear'], ['direction', 'north'], ['verb', 'run']]
    exception = assert_raise(ParserError) {parse_sentence(sentence)}
    assert_equal("Expected a verb next.", exception.message)
  end
end