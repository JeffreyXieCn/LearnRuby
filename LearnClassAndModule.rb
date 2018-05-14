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
#
x = 1;
p x.instance_of? Fixnum
p x.instance_of? Numeric
p x.is_a? Fixnum
p x.is_a? Integer
p x.is_a? Numeric
p x.kind_of? Comparable
p x.kind_of? Object

class Point
  include Comparable
  
  @class_instance_var = 7
  class << self
    attr_accessor :class_instance_var
  end

  # Initialize our class variables in the class definition itself
  @@n = 0 # How many points have been created
  @@totalX = 0 # The sum of all X coordinates
  @@totalY = 0 # The sum of all Y coordinates

  attr_accessor :x, :y # Define accessor methods for our instance variables
  def initialize(x,y)
    @x,@y = x, y # Sets initial values for instance variables
    # Use the class variables in this instance method to collect data
    @@n += 1 # Keep track of how many Points have been created
    @@totalX += x # Add these coordinates to the totals
    @@totalY += y
  end

  ORIGIN = Point.new(0, 0)
  UNIT_X = Point.new(1, 0)
  UNIT_Y = Point.new(0, 1)

  def +(other) # Define + to do vector addition
    raise TypeError, "Point argument expected" unless other.is_a? Point
    Point.new(@x + other.x, @y + other.y)
  end
  def -@ # Define unary minus to negate both coordinates
    Point.new(-@x, -@y)
  end
  def *(scalar) # Define * to perform scalar multiplication
    Point.new(@x*scalar, @y*scalar)
  end

  def to_s # Return a String that represents this point
    "(#@x,#@y)" # Just interpolate the instance variables into a string
  end

  def eql?(other)
    #p "inside eql?()"
    if other.instance_of? Point
      @x.eql?(other.x) && @y.eql?(other.y)
    else
      false
    end
  end

  def hash
    code = 17
    code = 37*code + @x.hash
    code = 37*code + @y.hash
    # Add lines like this for each significant instance variable
    code # Return the resulting code
  end

  # Define an ordering for points based on their distance from the origin.
  # This method is required by the Comparable module.
  def <=>(other)
    return nil unless other.instance_of? Point
    @x**2 + @y**2 <=> other.x**2 + other.y**2
  end

  def add!(p)
    @x += p.x
    @y += p.y
    self
  end

  def add(p)
    q = self.dup
    q.add!(p)
  end

  def self.sum(*points)
    x = y = 0
    points.each{|p| x += p.x; y += p.y}
    Point.new(x,y)
  end

  # A class method to report the data we collected
  def self.report
    # Here we use the class variables in a class method
    puts "Number of points created: #@@n"
    puts "Average X coordinate: #{@@totalX.to_f/@@n}"
    puts "Average Y coordinate: #{@@totalY.to_f/@@n}"
  end

  class << self
    def n
      @@n
    end

    def totalX
      @@totalX
    end

    def totalY
      @@totalY
    end
  end


=begin
  def ==(other)
    @x == other.x && @y == other.y
  end
=end

  alias == eql?  # the == method defined here will hide the == in Comparable

  protected
  def protected_fun
    puts "I am a protected method"
  end
end

Point::NEGATIVE_UNIT_X = Point.new(-1, 0)

pt1 = Point.new(3, 4)
pt2 = Point.new(5, 6)
pt3 = pt1 + pt2
puts pt1, pt2, pt3
pt4 = Point.new(3, 4)
pt5 = Point.new(4, 3)
p pt5
p ((pt1 == pt4))
puts pt1.eql?(pt4)
p pt1 == pt2
puts pt1.eql?(pt2)
p pt1.hash
p pt2.hash
p pt4.hash
p pt1 < pt2
p pt1 == pt5

p Point.sum(pt1, pt2, pt5)
Point.report
p Point.n
p Point.totalX
p Point.totalY
#pt1.protected_fun #protected method `protected_fun' called for #<Point:0x4ede810 @y=4, @x=3> (NoMethodError)

class Point3D < Point
  @class3d_instance_var = 13
  class << self
    attr_accessor :class3d_instance_var
  end
  
  def initialize(x,y,z)
    # Pass our first two arguments along to the superclass initialize method
    super(x,y)
    # And deal with the third argument ourself
    @z = z;
  end
  
  ORIGIN = Point3D.new(0,0,0)
  
  def to_s
    "(#@x, #@y, #@z)" # Variables @x and @y inherited? No
  end
  
end

p Point::ORIGIN
p Point3D::ORIGIN
p Point.class_instance_var
Point.class_instance_var = 9
p Point.class_instance_var
p Point3D.class_instance_var #nil class instance variable is not inheritted
p Point3D.class3d_instance_var