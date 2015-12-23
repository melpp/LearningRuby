=begin
Program will add a new movie to a hash, update the rating for an existing movie, display the movies and ratings that are already in the hash, or delete a movie from the hash. If it doesn't receive one of those four commands, the program will output some kind of error message.
=end

movies = { Magnolia: 5, NothingHill:1,
           Babel: 4}
loop do

puts "What would you like to do? Your choices are: add, update,display, delete. Type exit or quit to quit"
choice = gets.chomp.downcase

case choice
when "add"
  puts "Which movie would you like to add?"
  title= gets.chomp.capitalize.to_sym
  puts "What is your rating for #{title}?"
  if movies[title.to_sym].nil?
    rating= gets.chomp.to_i
    movies[title] = rating
    puts "#{title} was added to your database and it's rating is #{rating}"
  else
    puts "This movie already exist in your database. It's rating is #{movies[title.to_sym]}. Choose update on next menuto update our rating."
  end

when "update"
  puts "Which movie would you like to update"
  title= gets.chomp.capitalize.to_sym
  if movies[title].nil?
      puts " #{title} is not in your database. Please choose add in the next menu if you would like to add"
  else
      puts "Please enter your new rating"
      rating = gets.chomp.to_i
      movies[title] = rating
      puts "#{title}'s rating is updated.It is ${rating} now."
  end

when "display"
  movies.each do |movie, rating|
      puts "Movie: #{movie}, Rating: #{rating}"
  end

when "delete"
  puts "Which movie would you like to delete from your database"
  title = gets.chomp.capitalize.to_sym
  if movies[title].nil?
      puts "The movie you would like to delete do not exist"
  else
      movies.delete(title)
      puts "#{title} successfully deleted from your database"
    end

when "exit", "quit"
  break

else
  puts "Error!"
end
end
