#var=var || something
# . || operator evaluates the left side
#     .If true, returns it
#     .Else, returns the right side
#     .@x = @x || 5 will return 5 the first time and @x the next time???
#Short form : @x||=5 same as above

#Inheritance is the process by which one class takes on the attributes and methods of another, 
#and it's used to express an is-a relationship. For example, a cartoon fox is a cartoon mammal, 
#so a CartoonFox class could inherit from a CartoonMammal class. However, a Wizard is not an Elf , 
#so it shouldn't inherit from the Elf class (even if they have a lot of magical attributes and methods in common). 
#Instead, both Wizard and Elf could ultimately inherit from the same MagicalBeing class.
#inheritance syntax:
# class DerivedClass < BaseClass
   # Some stuff!
# end


class Person
	attr_reader :age
	attr_accessor :name

	def initialize(name, ageVar)
		@name=name
		self.age = ageVar #call the age= method. If there was not self, ruby would think it is a local variable
	end

	def age= (new_age)
		@age||=5 #default
		@age = new_age unless new_age > 120 
	end
end

person1 = Person.new("Kim",135) 
puts person1.age #=>5
person1.age=10
puts person1.age #=>10
person1.age=200
puts person1.age #=>10

#Class Methods and Variables
# . Invoked on the class(as opposed to instance of class)(similar to static methods in java)
# . self OUTSIDE of the method definiton refers to the Class pbject
# . Class variables begin with @@

#Here is the example of three differnet ways to define class methods in Ruby

class MathFunctions
	def self.double(var) #1. Using self
      times_called; var * 2;
    end

    class << self #2.Using <<self
    	def times_called
    		@@times_called ||=0; @@times_called +=1
    	end
    end
end

def MathFunctions.triple(var) # 3. Outside of the class
	   times_called; var*3
end


puts MathFunctions.times_called #=>1
puts MathFunctions.double 3 #=>6
puts MathFunctions.triple(3) #=>9
puts MathFunctions.times_called #=>4

# Class Inheritance
# . Every class implicitly inherits from Object
#   . Object itself inherits from BasicObject
# . No multiple inheritence in Ruby
#   . Mixins are used instead

class Dog #Implicity inherits from object
	def to_s
		"Dog"
	end
	def bark
		"barks loudly"
	end
end

class SmallDog < Dog # < denotes inheritance 
	def bark #Override
		"barks quietly"
	end
end

dog = Dog.new
small_dog = SmallDog.new

puts "#{small_dog.to_s} #{small_dog.bark}" # => Dog barks quietly


