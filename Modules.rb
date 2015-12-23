########## MODULES #############
# Modules are containers for classes, methods and constants
# Like a class but cannot be instantiated. So, we cannot have an object of a specific module.
# But we can have an object of a class. Class iherits from Module and adds new
# Serves 2 main purpose: 1.Namespace; 2.Mix-in

#Module as Namespace

module Sports
	class Match
		attr_accessor :score
	end
end

module Patterns
	class Match
		attr_accessor :complete
	end
end

match1 = Sports::Match.new
match1.score =45; puts match1.score #=>45

match2 = Patterns::Match.new
match2.complete = true; puts match2.complete # =>true

##M Module as Mixin
# . Interfaces in OO
#    . Contract what a class could do
# . Mixins provide a way to share (mix-in) ready code among multiple classes
# We can include built-in modules like Enumerable that can do the hard work for me

#Module as Mixin

module SayMyName
	attr_accessor :name
	def print_name
		puts "Name: #{@name}"
	end
end

class Person
	include SayMyName
end
class Company
	include SayMyName
end

person = Person.new
person.name = "Eloise"
person.print_name

company = Company.new
company.name= "Airbnb"
company.print_name

# Enumarable Module - We could include built-in modules from a Ruby itself
# . map,select, reject, detect etc
# . Used by Array class and many others
# . You can include it in your own class
# . Provide an implementation for each method

# name of file - player.rb
class Player 

  attr_reader :name, :age, :skill_level

  def initialize (name, age, skill_level) 
    @name = name 
    @age = age
    @skill_level = skill_level 
  end

  def to_s 
    "<#{name}: #{skill_level}(SL), #{age}(AGE)>" 
  end 
end 

# team.rb 
class Team 
  include Enumerable # LOTS of functionality

  attr_accessor :name, :players 
  def initialize (name) 
    @name = name 
    @players = [] 
  end 
  def add_players (*players) # splat we don't know how many players
    @players += players
  end 
  def to_s 
    "#{@name} team: #{@players.join(", ")}" 
  end 
  def each 
    @players.each { |player| yield player } # because of enumarable
  end 
end 

#main.rb

require_relative 'player' #includes the class files
require_relative 'team'

player1 = Player.new("Bob", 13, 5); player2 = Player.new("Jim", 15, 4.5) 
player3 = Player.new("Mike", 21, 5) ; player4 = Player.new("Joe", 14, 5) 
player5 = Player.new("Scott", 16, 3)

red_team = Team.new("Red") 
red_team.add_players(player1, player2, player3, player4, player5) # (splat) 

# select only players between 14 and 20 and reject any player below 4.5 skill-level
#Because team includes enumarables we can do all these operations
elig_players = red_team.select {|player| (14..20) === player.age } 
                       .reject {|player| player.skill_level < 4.5} 
puts elig_players # => <Jim: 4.5(SL), 15(AGE)>
				  # => <Joe: 5(SL), 14(AGE)>
