puts "Text please(Don't use any punctuation. Otherwise my dumb program will mess up. I will make the smarter one soon!):"
text = gets.chomp

words = text.split
frequencies = Hash.new(0)

words.each do |x|
    frequencies[x] +=1
end

frequencies = frequencies.sort_by do |word,count|

end

frequencies.reverse!

frequencies.each do |word, count|
    puts word+ " " + count.to_s
end
