#        OOP
# . Identify things your program is dealing with
# . Classes are things(blueprints)
#     .Containers of methods (behavior)
# . Objects are instances of those things
# . Objects contain instance variables (state) -Property of an object

#       Instance Variables
# . Begin with @ -@name
# .Not declared
#     .Once Spring into existance when first used they are
# . Avaiable to all instance methods of the class

#       Object Creation
# . Classes are factories
#     .Calling new method creates an instance of classes
#          new causes initialize
# . Object's state can be (should be) initialized inside the initialize 
# method, the "constructor"

class Person
  def initialize (name, age)
  	@name=name
  	@age=age
  end
  def get_info
  	@additional_info = "Interesting"
  	"Name: #{@name}, age: #{@age}"
  end
end 

person1 = Person.new("Ipek", 13)
p person1.instance_variables #Output => [:@name, :@age]
puts person1.get_info #Output => Name: Ipek, age: 13
p person1.instance_variables #Output => [:@name, :@age, :@additional_info]

#         Accessing Data
# . Instance variable are private.
#    .Cannot be accessed from outside the class
# . Methods have public access by default
# . To access instance variables - need to define
#    "getter" / "setter" methods

class Person
	def initialize (name, age) #Consturctor
		@name=name
		@age =age
	end
	#name getter
	def name
		@name
	end
	#name setter
	def name=(new_name)
		@name=new_name
	end
end

person1 = Person.new("Ipek",13)
puts person1.name #Output=> Ipek
person1.name = "Miray"
puts person1.name #Output=> Miray

#There is an easier way/syntax to get and set instance variable values
# attr_* form instead
# . attr_accessor - getter and setter
# . attr_reader - getter only
# . attr_writer - setter only

class Student
	attr_accessor :name, :age #getters and setters for name and age
end

student1 = Student.new
p student1.name #Output => nil
student1.name="Mike"
student1.age= "13"
puts student1.name #Output => Mike
puts student1.age #Output=>13
puts student1.age= "twenty" #Output => twenty
#Ruby is dynamic language. It can start with integer and goes to string,....
student2 = Student.new
student2.age="twenty"
puts student2.age #Output => twenty

# Two problems with the previous example
# 1. Person is an unitiliazed state upon creation(without a name or age)
# 2. We proably want o control maximum age assigned
# Solution: Use a constructor that passes values and a more intelligent age setter
############# self ###############
# . Inside instance method, self refers to the object itself
# . Usually using self for calling the oother methods of the same instance is extraneous
# . But sometimes, using self is required
#     . Ex.- When it could mean a local variable assignment
# . Outside instance self method definition, self refers to the class itself

class Person
	attr_reader :age
	attr_accessor :name

	def initialize(name, ageVar)
		@name=name
		self.age = ageVar #call teh age method. If there was not self, ruby would think it is a local variable
		puts age
	end

	def age= (new_age)
		@age = new_age unless new_age > 120 
	end
end

person1 = Person.new("Dia",15) #Output=>15
puts "#{person1.name} is #{person1.age} years old." #Output => Dia is 15 years old.
person1.age = 125 #Output => 
puts person1.age#Output => 15
