# print the Fibonacci sequence
p (1..20).inject( [0, 1] ) { | fib | fib << fib.last(2).inject(:+) }

# Sum some numbers
p (5..10).reduce(:+)                             #=> 45
# Same using a block and inject
p (5..10).inject { |sum, n| sum + n }            #=> 45
# Multiply some numbers
p (5..10).reduce(1, :*)                          #=> 151200
# Same using a block
p (5..10).inject(1) { |product, n| product * n } #=> 151200
# find the longest word
longest = %w{ cat sheep bear }.inject do |memo, word|
  memo.length > word.length ? memo : word
end
p longest                                        #=> "sheep"


r = 'a'..'z'
p r.to_a
oddLetter = []
r.step(2){|l| oddLetter << l}
p oddLetter
p r.step(2).to_a

triples = "AAA".."ZZZ"
p triples.include? "ABCD"
p triples.cover? "ABCD"