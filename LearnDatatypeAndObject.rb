p 1 == 1.0 #true
p 1.eql?(1.0) #false

p (1..10) === 5 # true: 5 is in the range 1..10
p /\d+/ === "123" # true: the string matches the regular expression
p String === "s" # true: "s" is an instance of the class String
p :s === "s" # true in Ruby 1.9, false in Ruby 2.3.4

s = "ice"
s.freeze
p s.frozen?
p s.upcase
#p s.upcase! #can't modify frozen String (RuntimeError)
#s[0] = "ni" #can't modify frozen String (RuntimeError)
#
s = "untrusted" # Objects are normally untainted
p s.taint # Mark this untrusted object as tainted
p s.tainted? # true: it is tainted
p s.upcase.tainted? # true: derived objects are tainted
p s[3,4].tainted? # true: substrings are tainted