#Searches string of text that I entered for the word I choose and replace it with the phrase "SECRET WORD"
puts "Enter the text to search through:"
text = gets.chomp
puts "Enter the word you would like to redact:"
redact = gets.chomp
text.delete!(",")
text.delete!(".")
text.delete!("!")
text.upcase!
redact.upcase!

words = text.split(" ") #Returns an array with the each word in text. 
#.split divides the string whenever it sees a bit of text, called delimiter. It is space
#in our case. 

words.each do |x|
  if x==redact
     x.replace "SECRET WORD"
   end 
end

redacted_text= words.join(' ')
puts redacted_text
