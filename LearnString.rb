# -*- coding: utf-8 -*-
# 
foo = "foo"
puts foo.object_id
foo2 = foo
puts foo2.object_id
foo.concat "bar"
puts foo.object_id

puts foo #"foobar"
puts foo2 #"foobar"

foo += "baz"
puts foo.object_id
puts foo #"foobarbaz"
puts foo2 #"foobar"
puts foo2.object_id

5.times {p "test".object_id}

hello = "hello"
p "hello.ojbect_id #{hello.object_id}"
hello = hello + " world"
p "hello.ojbect_id #{hello.object_id}"
hello << " for me"
p "<< will change the string on the left. hello.ojbect_id #{hello.object_id}"

p "#################Here Document##########"
greeting = <<HERE + <<THERE + "World"
Hello
HERE
There
THERE

p greeting
puts greeting

################
#=begin print won't add a newline at the end of printing
s = "¥1000"
s.each_char {|x| print "#{x} " }
puts "***"
#=end

# This is a string literal containing a multibyte multiplication character
s = "2×2=4"
# The string contains 6 bytes which encode 5 characters
print s, " s.length = ", s.length # => 5: Characters: '2' '×' '2' '=' '4'
puts
print "s.bytesize = ", s.bytesize # => 6: Bytes (hex): 32 c3 97 32 3d 34
puts
print "s.ascii_only? = %s\n" % s.ascii_only?
puts s.encoding

money = "\u{20AC A3 A5}" # => "€£¥"

puts "money ", money

#Encoding.list.each {|enc| p enc}