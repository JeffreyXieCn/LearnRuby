class ABC
  def xyz
    puts "xyz in ABC"
  end
end

ABC::new::xyz
ABC::new.xyz
ABC.new::xyz
ABC.new.xyz

module Example
  Version = 1.0

  class << self # We are accessing the module's singleton class
    def hello(who = "world")
      "Hello #{who}"
    end
  end
end #/Example

p Example::hello # => "Hello world"
p Example.hello "hacker" # => "Hello hacker"

p Example::Version # => 1.0
#Example.Version # NoMethodError
#

##############################
MR_COUNT = 0        # constant defined on main Object class
module Foo
  MR_COUNT = 0
  ::MR_COUNT = 1    # set global count to 1
  MR_COUNT = 2      # set local count to 2
end

puts MR_COUNT       # this is the global constant
puts Foo::MR_COUNT  # this is the local "Foo" constant

################################
class Klass
  attr_accessor :str
end

module Foo
  def foo; 'foo'; end
end

s1 = Klass.new #=> #
s1.extend(Foo) #=> #
p s1.foo #=> "foo"

s2 = s1.clone #=> #
p s2.foo #=> "foo"

s3 = s1.dup #=> #
#p s3.foo #=> NoMethodError: undefined method `foo' for #