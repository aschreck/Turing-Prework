def RandomGame
  puts "I have selected a random number! Get ready to GUESS."
  print ">"
  guess = gets.chomp.to_i
  answer = rand(100).to_i
  wrongcount = 0
  tripwire = 0
  while guess != answer #will remain in loop until guess and answer are equal
    wrongcount += 1

    if guess > answer #if condition gives a hint
      puts "Too big!"
      puts"-" * 20
    else
      puts "Too small!"
      puts"-" * 20
    end

    if wrongcount > 4 && tripwire == 0 #will offer divisibility hints after 5 errors
      DivisibilityTest(answer) #but only once.
      tripwire += 1
    end

    puts "What's your new guess?"
    print ">"
    guess = gets.chomp.to_i



  end #end of the while loop

puts "You're a Winner, Harry! You won in #{wrongcount} steps"  #once the guesser breaks through the loop

end

def DivisibilityTest(number) #puts the number
  divisors = [2, 3, 5, 7]
  hint = []

  divisors.each do |divisor|

    if number % divisor == 0 #adds each divisible number to an array
      hint.push(divisor)
    end

  end
  puts "Here's a hint: My number is divisible by:"
  puts hint
end

RandomGame()
