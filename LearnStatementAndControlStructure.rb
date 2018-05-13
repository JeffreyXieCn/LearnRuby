require 'open-uri'
x = 7

if x == 1
  name = "one"
elsif x == 2
  name = "two"
elsif x == 3 then
  name = "three"
elsif x == 4;
  name = "four"
else
  name = "many"
end

p name


name2 = if x == 1 then
          "one"
        elsif x == 2 then
          "two"
        elsif x == 3 then
          "three"
        elsif x == 4 then
          "four"
        else
          "many"
        end

p name2

name3 =
    case
    when x == 1
      "one"
    when x == 2
      "two"
    when x == 3
      "three"
    else
      "many"
    end

p name3

name4 =
    case x
    when 1
      "one"
    when 2 then "two"
    when 3; "three"
    else "many"
    end

p name4

puts case x
     when String then "string"
     when Numeric then "number"
     when TrueClass, FalseClass then "boolean"
     else "other"
     end

x = y = z = 0
unless x == 0
  puts "x is not 0"
else
  unless y == 0
    puts "y is not 0"
  else
    unless z == 0
      puts "z is not 0"
    else
      puts "all are 0"
    end
  end
end

income = 100000
# Compute 2006 U.S. income tax using case and Range objects
tax = case income
      when 0..7550
        income * 0.1
      when 7550..30650
        755 + (income-7550)*0.15
      when 30650..74200
        4220 + (income-30655)*0.25
      when 74200..154800
        15107.5 + (income-74201)*0.28
      when 154800..336550
        37675.5 + (income-154800)*0.33
      else
        97653 + (income-336550)*0.35
      end

puts "tax = #{tax}"

# Count back up to 10 using an until loop
x = 0 # Start at 0 (instead of -1)
until x > 10 do # Loop until x is greater than 10
  puts x
  x = x + 1
end # Loop ends here

p x

x = 0
puts x = x + 1 while x < 10

x = 10 # Initialize loop variable
begin # Start a compound expression: executed at least once
  puts x # output x
  x = x - 1 # decrement x
end until x == 0 # End compound expression and modify it with a loop

# Print the elements in an array
array = [1,2,3,4,5]
for element in array
  puts element
end

puts "Using while:"
idx = 0
while idx < array.size
  print array[idx]
  idx += 1
end
puts

array.each {|ele| print ele}
puts

# Print the keys and values in a hash
hash = {:a=>1, :b=>2, :c=>3}
for key,value in hash
  puts "#{key} => #{value}"
  varInLoop = "Jeffrey"
end
p key # accessible outside of for loop
p value
p varInLoop

hash.each do |my_key, my_value|
  puts "#{my_key} = > #{my_value}"
end

#p my_key # undefined local variable or method `my_key' for main:Object (NameError)
#p my_value
#
3.times {puts "thank you!"}
factorial = 1
2.upto(9) {|x| factorial *= x}
p factorial

evens = (1..10).select {|x| x % 2 == 0}
p evens

odds = (1..10).reject {|x| x % 2 == 0}
p odds

data = [2, 5, 3, 4]
sum = data.inject {|sum, x| puts sum + x; sum + x } # => 14 (2+5+3+4) block is executed only 3 times
p sum
floatprod = data.inject(1.0) {|p,x| p*x } # => 120.0 (1.0*2*5*3*4)
p floatprod
max = data.inject {|m,x| m>x ? m : x } # => 5 (largest element)
p max

# sequence(3, 5, 1) {|y| puts y } # undefined method `sequence' for main:Object (NoMethodError)

# This method expects a block. It generates n values of the form
# m*i + c, for i from 0..n-1, and yields them, one at a time,
# to the associated block.
def sequence(n, m, c)
  i = 0
  while(i < n) # Loop n times
    yield m*i + c # Invoke the block, and pass a value to it
    i += 1 # Increment i each time
  end
end

# Here is an invocation of that method, with a block.
# It prints the values 1, 6, and 11
sequence(3, 5, 1) {|y| puts y }

str1 = "hello"
p str1.each_char.map{|c| c.succ}
p str1.chars.map{|c| c.upcase}

iterator = 9.downto(1)
loop do # Loop until StopIteration is raised
  print iterator.next # Print next item
end
puts "...blastoff!"

# Call the each method of each collection in turn.
# This is not a parallel iteration and does not require enumerators.
def sequence(*enumerables, &block)
  enumerables.each do |enumerable|
    enumerable.each(&block)
  end
end
# Iterate the specified collections, interleaving their elements.
# This can't be done efficiently without external iterators.
# Note the use of the uncommon else clause in begin/rescue.
def interleave(*enumerables)
# Convert enumerable collections to an array of enumerators.
  enumerators = enumerables.map {|e| e.to_enum }
# Loop until we don't have any more enumerators.
  until enumerators.empty?
    begin
      e = enumerators.shift # Take the first enumerator
      yield e.next # Get its next and pass to the block
    rescue StopIteration # If no more elements, do nothing
    else # If no exception occurred
      enumerators << e # Put the enumerator back
    end
  end
end
# Iterate the specified collections, yielding tuples of values,
# one value from each of the collections. See also Enumerable.zip.
def bundle(*enumerables)
  enumerators = enumerables.map {|e| e.to_enum }
  loop { yield enumerators.map {|e| e.next} }
end
# Examples of how these iterator methods work
a,b,c = [1,2,3], 4..6, 'a'..'e'
sequence(a,b,c) {|x| print x} # prints "123456abcde"
puts
interleave(a,b,c) {|x| print x} # prints "14a25b36cde"
puts
bundle(a,b,c) {|x| print x} # '[1, 4, "a"][2, 5, "b"][3, 6, "c"]'

a = [1,2,3,4,5]
a.each {|x| puts "\n#{x},#{a.shift}" } # prints "1,1\n3,2\n5,3"

i = 0
while(i < 3) # Prints "0123" instead of "012"
# Control returns here when redo is executed
  print i
  i += 1
  redo if i == 3
end

=begin
puts "Please enter the first word you think of"
words = %w(apple banana cherry) # shorthand for ["apple", "banana", "cherry"]
response = words.collect do |word|
# Control returns here when redo is executed
  print word + "> " # Prompt the user
  response = gets.chop # Get a response
  if response.size == 0 # If user entered nothing
    word.upcase! # Emphasize the prompt with uppercase
    redo # And skip to the top of the block
  end
  response # Return the response
end
=end

=begin
n = 10
n.times do |x| # Iterate n times from 0 to n–1
  print x # Print iteration number
  if x == 9 # If we've reached 9
    n -= 1 # Decrement n (we won't reach 9 the next time!)
    retry # Restart the iteration Invalid retry (SyntaxError)
  end
end
=end

puts "\n====raise exception===="
def factorial(n) # Define a factorial method with argument n
  #raise "bad argument" if n < 1 # Raise an exception for bad n #bad argument (RuntimeError)
  raise TypeError, "Integer argument expected" if not n.is_a? Integer
  raise ArgumentError, "Expected argument >= 1. Got #{n}" if n < 1
  return 1 if n == 1 # factorial(1) is 1
  n * factorial(n-1) # Compute other factorials recursively
end

begin
 p factorial("me")
rescue ArgumentError => ex
  puts "Try again with a value >=1"
rescue TypeError => ex
  puts "Try again with an integer"
end

begin
  p factorial(-2)
rescue ArgumentError => ex
  puts "Try again with a value >=1"
rescue TypeError => ex
  puts "Try again with an integer"
end

p factorial(5)

=begin
tries = 0 # How many times have we tried to read the URL
begin # This is where a retry begins
  tries += 1 # Try to print out the contents of a URL
  open('http://www.google.com') {|f| puts f.readlines }
rescue OpenURI::HTTPError => e # If we get an HTTP error
  puts e.message # Print the error message
  if (tries < 4) # If we haven't tried 4 times yet...
    sleep(2**tries) # Wait for 2, 4, or 8 seconds
    retry # And then try again!
  end
end
=end

a = 4;
if (true)
  END { # This END is executed
    puts "if"; # This code is registered
    puts a # The variable is visible; prints "5"
  }
else
  END { puts "else" } # This is not executed
end
10.times {END { a += 1; puts "loop" }} # Only executed once