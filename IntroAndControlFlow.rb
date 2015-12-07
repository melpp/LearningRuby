print "Chocolate \n"
puts "Chocolate".length #Starts a new line after puts the string. There is no need for \n"
puts "Chocolate".reverse.capitalize #Output= Etalocohc
puts "Milk Chocolate".reverse.capitalize #only first work is capitalized- Output = Etalocohc klim
puts "dark chocolate".capitalize #capitalize only the first word- Output = Dark chocolate
puts "Dark Chocolate".upcase #Output=DARK CHOCOLATE
puts "Dark Chocolate".downcase #Output= dark chocolate

name = "Dove"
puts name.downcase.reverse.upcase

=begin
This is how we write multiline comments.
Line 1
Line 2
Line 3
.
.
.
=end

puts 3+5
puts 2**3
puts 10%3

#Using control flow to check if something is false rather than true

hungry = false

unless hungry
  puts "I'm writing Ruby programs!"
else
  puts "Time to eat!"
end

#Other way to write
print "I am not hungry \n" unless hungry

#getting an input
print "What is your first name?"
first_name = gets.chomp
=begin
gets is the Ruby method that gets input from the user. 
When getting input, Ruby automatically adds a blank line (or newline) 
after each bit of input; chomp removes that extra line. 
(Your program will work fine without chomp, but you'll get extra blank lines everywhere.)
It would be like "Sabriye\n"
=end
first_name.capitalize! #! makes the changes permanent. 
                    #It overwrites/modifies the value contained within the variable first_name itself
                    
=begin
string methods to Daffy Duckify 
a user's string, replacing each "s" with "th".
=end

print "Please input"
user_input=gets.chomp
user_input.downcase! #so we do not need to search both for 's' and 'S'. Ruby is case sensitive

if user_input.include?("s")
    user_input.gsub!(/s/,"th") #gsub stands for global substitution
else #if you need else if it is written as elsif
    puts "there is no 's'"
end    

puts "here is the string '#{user_input}'" #This is called string interpolation
