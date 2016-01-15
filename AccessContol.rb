# When designing a class, it is important to think hpw much of it we will be exposing tot he world
#Encapsulation: try to hide the internal represantation of the object so you can change it later
# Three levels: public, protective andprivate
#   public methods: no access control is enforced. Anybody can call this class.
#   protected methods: can be invoked by the objects of the defining class or its subclasses
#   private methods: cannot be invoked with an explicit receiver.
#     Exception: setting an attribute can be invoked with an explicit receiver.

class Car
  def initialize(speed, comfort)
    @rating = speed * comfort
  end
  
  # Can't set rating from outside
  def rating
    @rating
  end
end

puts Car.new(4,5).rating #=>20

# Two ways to specify access control
# 1. Specify public, protected, private (Everything in ruby is public by default)
# 2. Define the methods reqularly and then specify public, private, protected access levels and 
# list the comma-seperated methods under those levels using mehod symbols.

class MyAlgorithm
  private
    def test1
      "Private"
    end
  protected
    def test2
      "Protected"
    end
  public
    def public_again
      "Public"
    end
end

class Another
  def test1
    "Private, as declared later on"
  end
  private :test1
end

class Person
  def initialize(age)
    self.age = age #LEGAL- EXCEPTION
    puts my_age
    # puts self.my_age #ILLEGAL - CANNOT USE SELF OR ANY OTHER RECEIVER
  end
  
#   private methods: cannot be invoked with an explicit receiver.
#     Exception: setting an attribute can be invoked with an explicit receiver.
  
  private
    def my_age
      @age
    end
    def age=(age)
      @age = age
    end
end

Person.new(25) #=>25
