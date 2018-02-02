puts 'Hello World'
def square(x)
  x * x
end

puts square 5

a = 3
b = 5
a, b = b, a
print " a = #{a}, b = #{b}"

chars = "hello world".tap {|x| puts "\noriginal object: #{x.inspect}"}
            .each_char .tap {|x| puts "each_char returns: #{x.inspect}"}
            .to_a .tap {|x| puts "to_a returns: #{x.inspect}"}
            .map {|c| c.succ } .tap {|x| puts "map returns: #{x.inspect}" }
            .sort .tap {|x| puts "sort returns: #{x.inspect}"}


a = 4
if true
  END { # This END is executed
    puts "if"; # This code is registered
    puts a # The variable is visible; prints "4"
  }
else
  END { puts 'else' } # This is not executed
end
10.times {END { puts 'loop'; a = 5 }} # Only executed once


def test
  puts "entering test method"
  proc = Proc.new { puts "entering proc"; break }
  proc.call # LocalJumpError: iterator has already returned  #break from proc-closure (LocalJumpError)
  puts "exiting test method" #this line is never executed
end
test