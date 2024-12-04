# Recursion Projects

I'm learning recursion and like everyone I also stumbled upon fibonacci sequence i.e. 0,1,1,2,3,5,8,13,21,.....so on. The idea is that except for first two numbers every other number is equal to the sum of two numbers preceding it. Like 5 is the sum of 3 and 2 & similarly 8 is the sum of 5 and 3.

Writing a function that will take an index (let's call it 'i') as an input and will return the corresponding value from the fibonacci sequence was easy for me. As the pattern here is trivial, return index if input is equal to 0 Or 1 otherwise return fibonacci(i - 1) + fibonacci(i - 2).

However, things became difficult when instead of just 1 value, we're asked to return an array of values. For example, fibonacci(5) should now output => [0, 1, 1, 2, 3] i.e. first 5 values of fibonacci series.

I struggled with wrapping my head around what to return and how and when to end my recursive calls to get the final answer. That's when I went back to the fundamentals and relearned few things. Here they are:

1. When your function hits `return` statement it pops out of the `call stack` and return the control flow to the previous function, which called it. Learning this helped me understand "what to return" part. Earlier I was returning integer values when the index is either 0 OR 1 and returning a `result` array on the final line but we're calling the same function over and over, so how can it have two different return types? We'll return array in every return statement. So for 1 OR 2 case I returned `[0] & [0,1]` respectively.

2. Factorial example helped me understand, how and what we can delegate. Like if you want to calculate factorial (5!) you need a factorial (4!). To find factorial, you need factorial, to find some values (first 5) you'll need some values (first 4). Similarly if I want to find first 5 values of fibonacci sequence, I'll need first 4 values and for first 4 values I'll need first 3 values and for first 2 values I have my return statement returning `[0,1]`


Here's my solution in Ruby.

```ruby
def rec_fibs(num)
  if num == 1
    return [0]
  elsif num == 2
    return [0, 1]
  end

  result = rec_fibs(num - 1)
  result << result[-1] + result[-2]
end
```

Building on above learnings it works as follows:

1) Base Case: If num is either 1 OR 2 then return [0] OR [0, 1] respectively.

2) Recursive definition : If you want first 4 values then give me first 3 values. If you want first 3 values give me first 2 values. (this will hit our return statement and return [0, 1] (result = [0, 1]). Then control of program will return to `rec_fibs(3)` on last line. (`result << result[-1] + result[-2])

3) So we got first 2 values and for first 3 values, take answer from (2) and add last 2 digits i.e. 0 + 1 = 1 and add it to the array. (result = [0, 1, 1]). Then control of program will return to `rec_fibs(4)` on last line. (`result << result[-1] + result[-2])

4) For first 4 values, take answer from (3) and add last two digits i.e. 1 + 1 = 2 and add it to the result array. (result = [0, 1, 1, 2])