module Lexicon
  ALLOWED_DIRECTION = %w[north south east west down up left right back]
  ALLOWED_VERB = %w[go stop kill eat]
  ALLOWED_STOP_WORD = %w[the in of from at it]
  ALLOWED_NOUN = %w[door bear princess cabinet]
  
  def self.scan(input)
    #puts "Entering Lexicon.scan()"
    parsedResult = []
    words = input.split
    words.each do |word|
      newword = word.downcase
      if ALLOWED_DIRECTION.include? newword
        parsedResult.push(['direction', newword])
      elsif ALLOWED_VERB.include? newword
        parsedResult.push(['verb', newword])
      elsif ALLOWED_STOP_WORD.include? newword
        parsedResult.push(['stop', newword])
      elsif ALLOWED_NOUN.include? newword
        parsedResult.push(['noun', newword])
      else
        begin
          number = Integer(word)
          parsedResult.push(['number', number])
        rescue
          parsedResult.push(['error', word])
        end
      end
    end
    return parsedResult
    
  end
end