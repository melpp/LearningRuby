#Single-quoted strings -Allow escaping of ' with \
#Double-quoted strings - Interpet scpecial characters like \n(new line) and \t (tab)
#                      - Allow string interpolation. (no need + to concenate)

single_quoted = 'ice cream \n followed by it\'s a party!'
double_quoted = "ice cream \n followed by it\'s a party!"

puts single_quoted # output => ice cream \n followed by it's a party!
puts double_quoted # output => ice cream 
                   #             followed by it's a party!

#Interpolation

#We can always use palin old + or << to add variable value to string

favorite_things = ["Ruby", "espresso", "candy"]

puts "A few of my favorite things:"

favorite_things.each do |thing|
  puts "I love " << thing << "!"
end

#but better way to write is with string interpolation
favorite_things.each do |thing|
  puts "I love #{thing}!"
end

def multiply (one, two)
	"#{one} multiplied by #{two} equals #{one*two}"
end

puts multiply(3,5)

#We can also use %Q{long multiline string}. It behaves as double-quated string

my_name = " sabriye"
puts my_name.lstrip.capitalize #Output=>Sabriye 
#lstrip returns a copy of the string in which all chars have been 
#stripped from the beginning of the string (default whitespace characters).
puts my_name.lstrip! #(destructive) removes the leading space. Modify
my_name[0] = 'T' #replace the first character
puts my_name

## %Q{long multiline string}.
cur_weather = %Q{It's a hot day outside.
                 Grab your umbrellas..}

puts cur_weather
#Output
#It's a hot day outside.
#                 Grab your umbrellas..

cur_weather.lines do |line|
	line.sub 'hot', 'rainy' #substitude hot with rainy
	puts line.strip
end

#Output
#It's a hot day outside.
#Grab your umbrellas..

#SYMBOLS are like highly optimized strings
# We can think of them as a sort of name. Symbols are not strings.
# "string" == :string # false
# Guaranteed to be unigue and immutable
# to string- to_s
#from string to symbol .to_sym or .intern
# Symbols always start with a colon (:). They must be valid Ruby variable names, 
# so the first character after the colon has to be a letter or underscore (_); after that, any combination of letters, numbers, and underscores is allowed.

# .object_id method gets the ID of an object - it is how Ruby knows whether two objects are the exact same object.
# Run the code in the editor to see that the two "strings" are actually different objects, whereas the :symbol is the same object listed twice.

puts "string".object_id # =>70226150490980
puts "string".object_id # =>70226150490840

puts :symbol.object_id # => 771548
puts :symbol.object_id # => 771548

#Create symbol

my_first_symbol=:firstSymbol

#Symbols pop up in a lot of places in Ruby, but they're primarily used either as hash keys or for referencing method names.
# Hash lookup is faster with symbols than the string keys
symbol_hash = {
  :one => 1,
  :two => 2,
  :three => 3,
}

#From strings to symbol with .to_sym
strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
symbols =[]
strings.each do |s|
    symbols.push(s.to_sym)
end
#From strings to symbol by .intern
strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
symbols =[]
strings.each do |s|
    symbols.push(s.intern)
end
# => This hash syntax is called hashed rocket style
movies = { :JackieBrown=>"Quantin Tarantino" , 
            :AntiChrist => "Lars Von Trier" }
           
#Here is new Hash syntax that changed in Ruby 1.9
#Semi colon is at the end of the word and no hash rockets.That word is still symbol though
movies = { JackieBrown:"Quantin Tarantino" , 
          AntiChrist: "Lars Von Trier" }

#Call and Response
#Symbols are awesome for referencing method names. 
# .respond_to? takes a symbol and returns true if an ojbect can receive that method and false otherwise

[1,2,3].respond_to?(:push) #returns true, since we can call .push on an array

[1,2,3].respond_to?[:to_sym] #would return false, since we can't turn an array into a symbol

age =26
#Rather than checking to see if our age variable is an integer, check to see if it will .respond_to? the .next method. 
#(.next will return the integer immediately following the integer it's called on, meaning 4.next will return 5.)
 age.respond_to?(:next) #return true

#Any object in ruby we can ask what are our methods and it will give us
#the methods that this objects supports

"hello".methods.grep /case/ #Calismadi. #grepping the methods for the word case
#Output [:casecmp, :upcase, :downcase, :swapcase, :upcase!, :downcase!, :swapcase!]
#Symbol can be representation of the method name like above. Method names are symbols





