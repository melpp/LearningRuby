#Collection of object references (auto-expandable)
#Indexed using [] oprator(method)
#Can be indexed with negative numbers or ranges
#Heterogeneous types allowed in the same array
#Can use %w{str1 str2} for string array creation

het_arr = [1, "two", :three] #Third one is symbol
#Array of strings
my_favorite_fruits = ["peach","cherry","melon"]
print my_favorite_fruits[0]

#Arrays of Arrays aka Multidimensional Arrays
multi_d_array = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
multi_d_array.each { |x| puts "#{x}" } #if I write "puts x" it will pring each element of array 
                                       #seperately, in a seperate line.??? 
                                        #print does not do that though
                                        
#Output: [0, 0, 0, 0]
#[0, 0, 0, 0]
#[0, 0, 0, 0]
#[0, 0, 0, 0]

s = [["ham", "swiss"], ["turkey", "cheddar"], ["roast beef", "gruyere"]]
puts s[0][1] #output:swiss

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
