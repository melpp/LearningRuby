#Single-quoted strings -Allow escaping of ' with \
#Double-quoted strings - Interpet scpecial characters like \n(new line) and \t (tab)
#                      - Allow string interpolation. (no need + to concenate)

single_quoted = 'ice cream \n followed by it\'s a party!'
double_quoted = "ice cream \n followed by it\'s a party!"

puts single_quoted # output => ice cream \n followed by it's a party!
puts double_quoted # output => ice cream 
                   #             followed by it's a party!

#Interpolation

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
# Guaranteed to be unigue and immutable
# to string- to_s
#from string to symbol to_sym

#Any object in ruby we can ask what are our methods and it will give us
#the methods that this objects supports

"hello".methods.grep /case/ #Calismadi. #grepping the methods for the word case
#Output [:casecmp, :upcase, :downcase, :swapcase, :upcase!, :downcase!, :swapcase!]
#Symbol can be representation of the method name like above. Method names are symbols





