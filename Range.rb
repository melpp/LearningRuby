##Ranges used to express natural consecutive sequences
# 1....20, 'a'...'z'
# Two dots-> all inclusive 1..10(1 is included,10 is included)
# Three dots -> end exclusive 1...10(1 is included, 10 is not included)
#They are very efficient because we only store start and end of it. Ruby knows rest of it.
# can be converted to array by to_a
# used for conditions and intervals

some_range =1..3
puts some_range.max #Output =>3
puts some_range.include? 2 #Output =>true

#Does the range from 1 to 10 include 5.3?
puts (1...10)===5.3 #Output =>true
puts ('a'...'r')==='r' #Output =>false

#Converting to an array
p ('k'..'z').to_a.sample(2) #Output => ["r", "z"]

age =55

case age
     when 0..12 then puts "Still a baby"
     when 13..19 then puts "Teenager"
     when 20..99 then puts "Young at heart"
     else puts "you are getting older"
end
#Output => Young at heart
