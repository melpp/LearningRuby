# Another important aspect of Ruby classes is scope. 
# The scope of a variable is the context in which it's visible to the program.

# When dealing with classes, you can have variables that are available everywhere (global variables), 
# ones that are only available certain methods (local variables), 
# others that are members of a certain class (class variables), 
# and variables that are only available to particular instances of a class (instance variables).

# some variables start with $, @, or @@. This helps mark them as global, instance, and class variables (respectively). 

class Computer
  $manufacturer = "Mango Computer, Inc."
  @@files = {hello: "Hello, world!"}
  
  def initialize(username, password)
    @username = username
    @password = password
  end
  
  def current_user
    @username
  end
  
  def self.display_files
    @@files
  end
end

# Make a new Computer instance:
hal = Computer.new("Dave", 12345)

puts "Current user: #{hal.current_user}"
# @username belongs to the hal instance.

puts "Manufacturer: #{$manufacturer}"
# $manufacturer is global! We can get it directly.

puts "Files: #{Computer.display_files}"
# @@files belongs to the Computer class.
