class MegaGreeter
    attr_accessor :names
    # Using attr_accessor defined two new methods for us, name to get the value, and name= to set it.

    #Create an object
    def initialize (names= "World")
        @names = names
    end

    #Say hi to everybody
    def say_hi
        if @names.nil?
           puts "..."
        # If the @names object responds to each, it is something that you can iterate over, so iterate over it and greet each person in turn.
        #Finally, if @names is anything else, just let it get turned into a string automatically and do the default greeting.
        elsif @names.respond_to?("each")
        #each is a method that accepts a block of code then runs that block of code for every element in a list, and the bit between do and end is just such a block.
        #A block is like ananonymous function or lambda. The variable between pipe characters is the parameter for this block.
           @names.each do |name|
               puts "Hi #{name}"
           end
        else
           puts " Hi #{@names}"
        end
    end
    
    #Say bye to everybody
    def say_bye
        if names.nil?
            puts "..."
        elsif @names.respond_to?("join")
            puts " Goodbye #{@names.join(" , ")}. Come back again!"
        else
           puts "Goodbye #{@names}. Come back again!"
        end
    end
end

#__FILE__ is the magic variable that contains the name of the current file. $0 is the name of the file used to start the program.
#This check says “If this is the main file being used…This allows a file to be used as a library, and not to execute code in that context, but if the file is being used as an executable, then execute that code.
if __FILE__ == $0
    
    mg = MegaGreeter.new
    mg.say_hi
    mg.say_bye
    
    
    mg.names = "Zeke"
    mg.say_hi
    mg.say_bye
    
    mg.names = ["John", "Katie", "Angela", "Ray", "Dylan"]
    mg.say_hi
    mg.say_bye
    
    mg.names = nil
    mg.say_hi
    mg.say_bye
    
    
end



