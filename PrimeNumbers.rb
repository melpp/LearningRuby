#The code in the editor is a Ruby method, first_n_primes, 
#that takes a number n and generates a list of the first n prime numbers. 
#We will refactor it.
=begin
	
$VERBOSE = nil    
require 'prime'   # This is a module.

def first_n_primes(n)

  unless n.is_a? Integer
    return "n must be an integer."
  end

  if n <= 0
    return "n must be greater than 0."
  end
  
  prime_array = [] if prime_array.nil?
  
  prime = Prime.new
  for num in (1..n)
    prime_array.push(prime.next)
  end
  return prime_array
end

first_n_primes(10)
=end	


$VERBOSE = nil    # this allowed us to use the old-style Prime.new from Ruby 1.8 without the interpreter yelling at us.
require 'prime'   

def first_n_primes(n)

  return "n must be an integer." unless n.is_a? Integer
   
   return "n must be greater than 0." if n <= 0
 
  
  prime_array ||= [] 
  
  prime = Prime.new
 n.times{prime_array<<prime.next}
  
  prime_array
end

 first_n_primes(10)

#Same program in ruby 1.9...We use Prime.instance instead, and the array magic is already buils in.
#We don't have to create prime_array or loop through it ourselves.

require 'prime'

def first_n_primes(n)
  # Check for correct input!
  "n must be an integer" unless n.is_a? Integer
  "n must be greater than 0" if n <= 0

  # The Ruby 1.9 Prime class makes the array automatically!
  prime = Prime.instance
  puts prime.first n
end

first_n_primes(10)
