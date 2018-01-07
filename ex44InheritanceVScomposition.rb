seperator = "=" * 30

class Parent
    def override()
        puts "PARENT override()"
    end
    
    def implicit()
        puts "PARENT implicit()"
    end
    
    def altered()
        puts "PARENT altered()"
    end
end

class Child < Parent
    def override()
        puts "CHILD override()"
    end
    
    def altered()
        puts "CHILD, BEFORE PARENT altered()"
        super()
        puts "CHILD, AFTER PARENT altered()"
    end
end

dad = Parent.new()
son = Child.new()

dad.implicit()
son.implicit()

dad.override()
son.override()

dad.altered()
son.altered()

puts seperator

class Comp
  def override()
    puts "COMP override()"
  end

  def implicit()
    puts "COMP implicit()"
  end

  def altered()
    puts "COMP altered()"
  end
end

class Whole
  def initialize()
    @comp = Comp.new()
  end

  def implicit()
    @comp.implicit()
  end

  def override()
    puts "WHOLE override()"
  end

  def altered()
    puts "WHOLE, BEFORE COMP altered()"
    @comp.altered()
    puts "WHOLE, AFTER COMP altered()"
  end
end

whole = Whole.new()

whole.implicit()
whole.override()
whole.altered()

puts seperator

module MyMod

  def override()
    puts "MYMOD override()"
  end

  def implicit()
    puts "MYMOD implicit()"
  end

  def MyMod.altered()
    puts "MYMOD altered()"
  end
end

class MyMain
  include MyMod

  def override()
    puts "MYMAIN override()"
  end

  def altered()
    puts "MYMAIN, BEFORE MYMOD altered()"
    MyMod.altered()
    # MyMod::altered()
    puts "MYMAIN, AFTER MYMOD altered()"
  end
end

mymain = MyMain.new()

mymain.implicit()
mymain.override()
mymain.altered()
