class Greeter
  def initialize (name = "Hello World!")
      @name=name
  end
  def say_hi
      puts "Hi #{@name.capitalize}!"
  end
  def say_bye
      puts "Bye #{@name. capitalize}, come back again!"
  end
end

greeter = Greeter.new ("sabriye")
greeter.say_hi
greeter.say_bye

Greeter.instance_methods

print "To findout about other methods exist for Greeter objects => Greeter.instance_methods \n "

print "Well this will give us all of the methods for Greeter objects, a complete list, including ones defined by ancestor classes. If we want to just list methods defined for Greeter we can tell it to not include ancestors by passing it the parameter false, meaning we don’t want methods defined by ancestors => Greeter.instance_methods(false) \n"
