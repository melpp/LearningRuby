### Reading From File

File.foreach( 'test.txt') do |line|
	puts "hello"
	puts line
	p line
	p line.chomp # chops off newline character
	p line.split # array of words in line
end

#output
=begin
hello
The first line of the file.
"The first line of the file.\n"
"The first line of the file."
["The", "first", "line", "of", "the", "file."]
hello
The second line of the file.
"The second line of the file."
"The second line of the file."
["The", "second", "line", "of", "the", "file."]
=end

#Handling Exception

begin
	File.foreach('do_not_exist.txt') do |line|
	  puts line.chomp
	end
rescue Exception =>e
	 puts e.message
	 puts "Let's pretend this did not happen..."
end

#Output=> No such file or directory @ rb_sysopen - do_not_exist.txt
#         Let's pretend this did not happen...

###Alternative to Exception- exist?

if File.exist? 'test.txt'
	File.foreach('test.txt') do |line|
	   puts line.chomp
    end  
end


### Writing to File

#if there is not a file called test1.txt if will create one
File.open("test1.txt", "w") do |line| # w indicates that opening a file to write
	line.puts "One line"              # does not matter if you use " " or''
	line.puts "Another"    #deletes whatever in the file and writes these
	line.puts "The other"
end

#Enviroment variables ???
#puts ENV["EDITOR"] 
