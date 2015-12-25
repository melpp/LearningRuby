# .collect method. =same as .map method 2 methods do exact same thing
# The collect method takes a block and applies the expression in the block to every element in an array.

my_nums =[1,2,3]
doubled= my_nums.collect {|num| num *2}
p doubled # => [1, 2, 3]

#Yield Method
#Why do some methods accept a block and others don't? It's because methods that accept blocks 
#have a way of transferring control from the calling method to the block and back again. 
#We can build this into the methods we define by using the yield keyword.

def block_test
  puts "We're in the method!"
  puts "Yielding to the block..."
  yield
  puts "We're back in the method!"
end
#If there is a yiled statement, we need to supply a block like below
block_test { puts ">>> We're in the block!" } #puts this sentence when yield
#Output
#We're in the method!
#Yielding to the block...
#>>> We're in the block!
#We're back in the method!

def yield_name(name)
  puts "In the method! Let's yield."
  yield("Kim")
  puts "In between the yields!"
  yield(name)
  puts "Block complete! Back in the method."
end

yield_name("Erich") { |n| puts "My name is #{n}." }

yield_name("Fromm") { |n| puts "My last name is #{n}." }

#Output
=begin
In the method! Let's yield.
My name is Kim.
In between the yields!
My name is Erich.
Block complete! Back in the method.
In the method! Let's yield.
My last name is Kim.
In between the yields!
My last name is Fromm.
Block complete! Back in the method.
=end

# ** Now, we know that methods accept blocks using the yield keyword.

def double(n)
    yield(n)
end

double(4) {|n| puts n*2} # => 4

############ PROCS ################
#  Everything is object in Ruby but BLOCKS are not object. That is why block can't be 
# saved to variables and don't have all the power and abilities of a real object.
#  For that we need PROCS!
#  We can think of a proc as a "saved" block: just like you can give a bit of code a 
# name and turn it into a method, you can name a block and turn it into a proc. 
#  Procs are great for keeping your code DRY, which stands for Don't Repeat Yourself. 
#  With blocks, you have to write your code out each time you need it; with a proc, 
# you write your code once and can use it many times!

multiples_of_3 = Proc.new do |n|
  n % 3 == 0
end

p (1..100).to_a.select(&multiples_of_3)
#Output
# [3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69, 72, 75, 78, 81, 84, 87, 90, 93, 96, 99]
 
doubled_= Proc.new do |num| 
	num *2
end
p (1..5).to_a.collect(&doubled_)  # =>[2, 4, 6, 8, 10]

floats = [1.2, 3.45, 0.91, 7.727, 11.42, 482.911]
round_down = Proc.new do |num|
    num.floor
end
ints = floats.collect(&round_down)
p ints # =>[1, 3, 0, 7, 11, 482]

#Block-proc-method-yield......
def greeter
    yield
end

phrase = Proc.new do
    puts "Hello there!"
end

greeter(&phrase)

# There is aeasier way to call procs than calling with method. 
# We can call procs directly with .call method

hi= Proc.new {puts "Hello!"}
hi.call # => Hello!

# Symbols and Procs . Here they meet!
# We can convert symbols to procs using &. 
# Remember, we also could pass a Ruby method name around with symbol

#Turn each string to an integer.

strings = ["1", "2", "3"]
nums = strings.map(&:to_i) 
p nums # ==> [1, 2, 3]

######### Lambda ###########
# Like procs, lambdas are objects. The similarities don't stop there: 
#with the exception of a bit of syntax and a few behavioral quirks, 
#lambdas are identical to procs.


#The codes about the same
lambda { puts "Hello!" } 
Proc.new { puts "Hello!" }

def lambda_demo(a_lambda)
  puts "I'm the method!"
  a_lambda.call #this line makes it ti print "I'm the lambda"
end

lambda_demo(lambda { puts "I'm the lambda!" })
#Output => I'm the method!
#          I'm the lambda!

#Lambda that converts from string to symbol

strings = ["leonardo", "donatello", "raphael", "michaelangelo"]
symbolize = lambda {|n| n.to_sym}
symbols = strings.collect(&symbolize)

# Differences between Lambda and Procs
# 1. lambda checks the number of arguments passed to it, while a proc does not. 
#   This means that a lambda will throw an error if you pass it the wrong number 
#   of arguments, whereas a proc will ignore unexpected arguments and assign nil to any that are missing.
#  2.  when a lambda returns, it passes control back to the calling method; 
#    when a proc returns, it does so immediately, without going back to the calling method.
# Check the below code to see how it works

def batman_ironman_proc
  victor = Proc.new { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_proc # =>Batman will win
#Because it returns immediately, without going back to the batman_ironman_proc method

def batman_ironman_lambda
  victor = lambda { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_lambda #=> Iron Man will win.
#Because lambda goes back into the method after being called, so the method returns the last code it evaluates.


#Checks which elements of the array are symbol
my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]
symbol_filter = lambda { |n| n.is_a? Symbol} #checks if the element in an array is symbol
symbols = my_array.select(&symbol_filter)
p symbols # => [:kettles, :mittens, :packages]

#Checks the hash values if any of them before m in alphabetical order
crew = {
  captain: "Picard",
  first_officer: "Riker",
  lt_cdr: "Data",
  lt: "Worf",
  ensign: "Ro",
  counselor: "Troi",
  chief_engineer: "LaForge",
  doctor: "Crusher"
}
first_half = lambda { |x,y| y < "M"}
a_to_m= crew.select(&first_half)
