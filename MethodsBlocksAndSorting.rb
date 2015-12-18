def array_of_10
 puts(1..10).to_a #creates and prints an array with numbers from 1 to 10.
end

array_of_10

#Splat argument: When we don't know how many arguments there are about to be, arguments 
#preceded by a * . 

def whats_up (greeting, *friends)
   friends.each {|friend| puts "#{greeting}, #{friend}."}
end

whats_up("Hey..hey", "Emma", "Louise", "Ashish")

#return
def add(x,y)
    return x+y
end

def greeter(name)
    return "Hi, #{name}!"
end

def by_three?(number)
    return number%3==0
end

#Methods names can end with ? , !(this has dangerous side effects though)

def can_divide_by?(number)
	return false if number.zero?
	true
end

puts can_divide_by?(3)
puts can_divide_by?(0)

#Factorial Method!!!! and Methods can have default argumenents

def factorial(n)
	n==0? 1 : n*factorial(n-1) #if n equals to 0 return 1 otherwise return n*....
end

def factorial_by_default(n=5)
	n==0? 1 : n*factorial_by_default(n-1)
end

puts factorial(5)
puts factorial_by_default
puts factorial_by_default(3)

#SPLAT

# *prefixes paramater inside method definition...can apply to middle paramater

def max(one_param, *numbers, another)
	#Variable length parameters passed in become an array
	numbers.max
end

puts max("something", 7, 35, -3, "more")

#Blocks: Nameless methods

1.times do
  puts "I'm a code block!"
end

1.times { puts "As am I!" }

# method that capitalizes a word
def capitalize(string) 
  puts "#{string[0].upcase}#{string[1..-1]}" #"#{string.capitalize}" 
end

capitalize("ryan") # prints "Ryan"
capitalize("jane") # prints "Jane"

# block that capitalizes each string in the array
["ryan", "jane","dane", "marie","rob"].each {|string| puts "#{string[0].upcase}#{string[1..-1]}"} 
# "#{string.capitalize}" would do the same job
# prints "Ryan", then "Jane", "dane",....."rob"  

#####A method can take a block as a parameter. .each taking a block as a parameter and doing stuff with it!

#Sorting
my_array= [1,2,5,7,3]
my_array.sort

=begin
Comparison

The combined comparison operator looks like this: <=>. 
It returns 0 if the first operand (item to be compared) equals the second, 
1 if first operand is greater than the second, and -1 if the first operand is less than the second.
=end

book_1 = "A Wrinkle in Time"

book_2 = "A Brief History of Time"

book_1 <=> book_2  #Output is 1.

#Sort in descending order z-a

books = ["Charlie and the Chocolate Factory", "War and Peace", "Utopia", "A Brief History of Time", "A Wrinkle in Time"]

# To sort our books in ascending order, in-place
books.sort! { |firstBook, secondBook| firstBook <=> secondBook }

# Sort your books in descending order, in-place below

books.sort! { |firstBook, secondBook| secondBook<=>firstBook}
