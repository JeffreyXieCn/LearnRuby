p 3**2**4
p 3**(2**4)
p 8**(1/3)
p 8**(1.0/3.0)

#p 3/0 #divided by 0 (ZeroDivisionError)
p 3.5/0.0 # Infinity

arr1 = [1,2,3]
p arr1*3
p arr1
p arr1*"#-#"

p Math.sqrt(9)

p __FILE__
p __LINE__
p __ENCODING__

if false
  foo = 'test'
end

p foo #nil
p defined? foo #"local-variable"
p defined? bar #nil
p Math::PI
p defined? Math::PI #"constant"

p defined? bar #nil

if false
  BAR = 'test'
end
#p BAR # uninitialized constant BAR (NameError)
p defined? BAR #nil

a = 3; b = 4
p ((a, b = b, a)) # double parentheses are needed here
print "a = %d, b = %d" % [a, b]

puts
arr = 1,2,3
p arr
#print (arr instance_of? Array) # undefined method `arr' for main:Object (NoMethodError)
#
x, *y = 1,2,3
print "x=", x
puts
print "y="
p y
p (0b1011 << 1).to_s(2)
p (0b10110 >> 2).to_s(2)
p ~3
p (0b1010 & 0b1100).to_s(2)

p "abc" =~ /\w+/
p "abc" =~ /\w+\d/
p "1abcd2" =~ /b\w+\d/ #2

(1..10).each{|x| print x if x==3..x==6} # prints 3456
puts
(1..10).each{|x| print x if x==3...x==6} # prints 3456
puts
(1..10).each{|x| print x if x==3..x>=6} # prints 3456
puts
(1..10).each{|x| print x if x==3...x>=6} # prints 3456

x = 3; y = 5; z = 4
max = x > y ? x > z ? x : z : y > z ? y : z
puts
p max

p defined? Math.sqrt

# print the contents of current file with line number
File.open(__FILE__) do |f|
  f.each_with_index do |line, number|
    print "#{number + 1}: #{line}"
  end
end