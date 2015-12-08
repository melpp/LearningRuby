#While Loop

i=0
while i<5
 puts i
 i+=1
end

#Until Loop

counter = 1
until counter > 10
  puts counter
  counter+=1
end

#For Loop

for num in 1..15 #Print numbers from 1 to 15 including 15 (2 dots means biggest number is included)
  puts num
end

for num in 1...15 #Print numbers from 1 to 15 excluding 15 (3 dots means biggest number is excluded)
  puts num
end

#The Loop Method

i = 20  
loop do  #In Ruby do and end are repalceble with "{" and "}"
  i -= 1
  next if i%2==1  #Skip odd numbers and prints only even numbers
  print "#{i}"
  break if i <= 0
end

# .each Iterator

array = [1,2,3,4,5]
#The variable name between | | can be anything you like: 
#it's just a placeholder for each element of the object you're using .each on.
array.each do |x|  
  x += 10
  puts x
end

# .times Iterator
10.times {print "I love bacon"}
