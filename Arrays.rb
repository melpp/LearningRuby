#Collection of object references (auto-expandable)
#Indexed using [] oprator(method)
#Can be indexed with negative numbers or ranges
#Heterogeneous types allowed in the same array
#Can use %w{str1 str2} for string array creation

het_arr = [1, "two", :three] #Third one is symbol

arr_words = %w{ what a great day today!}

#When it is negative it starts from the end "today!"" is -1
puts arr_words[-2] #Output=> day 

#Expressive method of arrays first, last
puts "#{arr_words.first}-#{arr_words.last}" #Outpput =>what-today!

#A range of elements specified. We say go back 3 and take 2 elemets from that
p arr_words[-3, 2] #Output=> ["great", "day"]

#Range- Grab me all elements 2 to 4 inclusive
p arr_words[2..4] #Output=> ["great", "day", "today!"]

#Make a string out of array elements seperated by ','
puts arr_words.join(',') #Output => what,a,great,day,today!

#Modifying Arrays
##Append: push or <<  push back of the array
##Remove: pop or shift
## Set: []=method
##We can randomly pull elements out from large arrays with sample
## sort! reverse!

##Stack, queue,...they all array. We can make arrays like them.

#We want stack. (LIFO)
stack =[]; stack << "one"; stack.push ("two")
puts stack.pop #Output =>two #it actually deleted it

#We want queue. (FIFO) 
queue=[]; queue.push "one"; queue.push"two"
puts queue.shift #Output=>one #it actually deleted the one
                 #shits the first element out of an array

a=[5,3,4,2].sort!.reverse!
p a #Output => [5, 4, 3, 2]
p a.sample(2) #2 random elements. Output=> [2, 5]

a[6] =33
p a #Output => [5, 4, 3, 2, nil, nil, 33]

#Other useful array methods
##each - loop through array
##select - filter array by selecting
##reject - filter array by rejecting
##map - modify each element in the array

a= [1,3,4,7,8,10]
a.each do |x|
	x+=5
	print x  #output => 689121315
end
puts #print new line
new_arr =a.select {|num| num>4}
p new_arr #output=> [7, 8, 10]

new_arr =a.select {|num| num<10}.reject {|num| num.even?}
p new_arr #output=> [1, 3, 7]

new_arr= a.map {|num| num*3}
p new_arr #Output => [3, 9, 12, 21, 24, 30]

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

#nested iteration on multidimetional array
s = [["ham", "swiss"], ["turkey", "cheddar"], ["roast beef", "gruyere"]]

s.each do |sub_array|
    sub_array.each do |element|
        puts element
    end
end
