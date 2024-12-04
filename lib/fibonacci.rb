# M-1 Iterative Approach
# fibs: input => number
#       output => array of n (number) fibonacci numbers
def fibs(number, result = [])
  counter = 0 # To track indices
  while counter < number
    if counter == 0 || counter == 1
      result[counter] = counter
      counter += 1
      next
    end

    result[counter] = result[counter - 1] + result[counter - 2]
    counter += 1
  end

  result
end

p fibs(2)
p fibs(3)
p fibs(4)
p fibs(5)
p fibs(6)
p fibs(7)
p fibs(8)
p fibs(9)
puts ""

# M-2: Recursive Approach
# def rec_fibs: input => number
#               output => array of fibonacci numbers containing n (number) elements
# Here num is acting as index and its returning the value from fibonacci array at that index
def rec_fibs(num)
  puts "This was printed recursively"
  if num == 1
    return [0]
  elsif num == 2
    return [0, 1]
  end

  result = rec_fibs(num - 1)
  result << result[-1] + result[-2]
end

p rec_fibs(2)
p rec_fibs(3)
p rec_fibs(4)
p rec_fibs(6)
p rec_fibs(7)
p rec_fibs(8)
p rec_fibs(9)

# get fibonacci value at a specific index
# def fibonacci(index)
#   if index == 0 || index == 1
#     return index
#   end

#   fibonacci(index - 1) + fibonacci(index - 2)
# end

# puts "Fibonacci sequence value"
# puts fibonacci(2)
# puts fibonacci(3)
# puts fibonacci(4)
# puts fibonacci(5)
# puts fibonacci(6)
# puts fibonacci(7)