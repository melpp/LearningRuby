def alphabetize(arr, rev=false)
    if rev
    arr.sort!
    arr.reverse!
  else
    arr.sort!
  end
end

numbers = [1,5,3,8]

alphabetize(numbers)

puts numbers
