#Indexed Collection of object references
#Created with either {} or Hash.new
#Also known as associative arrays. It means that aeach array element has index
##and they are integers. With hashes those indexes does not need to be an integer.
##Each element in the hash associated with the key. That is what it means.
#Index can be anything. Key, string, symbol,...

#Accessed using [] operator
# Values set using =>(creation), [](post creation)

#Hashes are key value pair like dictionaries
#Hash created using literal notations. 

my_hash = { "name" => "Sabriye", "favorite_creature"=>"Atum", 
            "beautiful?" => true, "age"=>33}

puts my_hash["name"]
puts my_hash[ "beautiful"]

#Using Hash.new and Adding to a Hash

pets = Hash.new
pets["Atum"] = "Dobby dog"
pets["Max"] = "Golden dog"

puts pets["Atum"] #output: Dobby dog

#nested iteration on multidimetional array
s = [["ham", "swiss"], ["turkey", "cheddar"], ["roast beef", "gruyere"]]

s.each do |sub_array|
    sub_array.each do |element|
        puts element
    end
end

#Hash Iterations

secret_identities = {
  "The Batman" => "Bruce Wayne",
  "Superman" => "Clark Kent",
  "Wonder Woman" => "Diana Prince",
  "Freakazoid" => "Dexter Douglas"
}
  
 
secret_identities.each do |x,y|
    puts x+": "+y  #or "#{x}: #{y}"
end



editor_props = {"font"=> "Arial", "size"=> 12, "color"=>"red"}

puts editor_props.length #Output=> 3
puts editor_props["font"] #Output=> Arial

editor_props["background"] ="Blue"
editor_props.each_pair do |key, value|
puts "key: #{key},  value: #{value}"
end

#Output
#key: font,  value: Arial
#key: size,  value: 12
#key: color,  value: red
#key: background,  value: Blue

#If you do not want your program to return nil for the 
#value do not exist you can create hash like that: Hash.new(0)
#Then default value will be 0 and it will be returned instead of nil

##Finds word frequency
word_frequecy = Hash.new(0)

sentence = "Chicka chicka boom boom boom"
sentence.split.each do |x|
	word_frequecy[x.downcase] += 1
end
p word_frequecy #Output => {"chicka"=>2, "boom"=>3}

#If a Hash is the last argument to a method {} are optional. We can drop them
#Order of putting things in hashes maintained in ruby

family_tree_19 = {oldest: "Jim", older: "Joe", younger:"Jack"} 
family_tree_19[:youngest]="Jeremy" 
p family_tree_19 #Output => {:oldest=>"Jim", :older=>"Joe", :younger=>"Jack", :youngest=>"Jeremy"}

#Named paramater "like" behavior

def adjust_colors (props={foreground: "red", background: "white"})
 puts "Foreground: #{props[:foreground]}" if props[:foreground]
 puts "Background: #{props[:background]}" if props[:background]
end
adjust_colors
#Output
# Foreground: red
# Background: white

adjust_colors ({:foreground => "green"}) #Output => Foreground: green
adjust_colors background: "yella" #Output => Background: yella
adjust_colors :background => "magenta" #Output => Background: magenta

a_hash = {:one =>"one"}
puts a_hash #Output => {:one=>"one"}
#but if we try to do it in one step, we will get a syntax error
puts {:one =>"one"} #Output is syntax error
#Ruby gets confused an thinks { } is a block

#To get around this -we canuse parenthesis
##puts is a method and you are passing aparameter which happens to be a hash
puts ({ :one => "one"})
 #or drop the {} altogether...Because it is the last method
 puts one: "one"

