# Q1
# -----
text = "The Flintstones Rock!"
10.times { |num| puts (' ' * num) + text }

# Q2
# -----
result = {}
statement = "The Flintstones Rock"
statement.each_char do |letter|
  if result.has_key?(letter)
    result[letter] = result[letter] + 1
  else
    result[letter] = 1
  end
end
puts result

# Q3
# -----
# You can't implicitly convert a number calculation to string without to_s
puts "the value of 40 + 2 is " + (40 + 2).to_s

# Q4
# -----
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# shift pops the first element => after first we're left with [2, 3, 4]
# that then goes to 3, 4 and the iteration is over

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# after first iteration [1, 2, 3], but then just [1, 2]

# Q5
# -----
def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend <= 0
  divisors
end

p factors(15)

# Q6
# -----
# Only the first implementation will mutate the buffer b/c of <<

# Q7
# -----
limit = 15

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# local variables cannot be accessed inside of methods...have to add it as argument.

# Q8
# -----
# Actually, this method is insufficient. You would need to hold a list of lower-cased
# words to check against before capitalizing to follow the correct titlization.
DO_NOT_CAPITALIZE = %w(a an the at by for in into of on to up and as but or nor)
words = "An example to make into a title."
to_print = words.split.map { |word| word.downcase.capitalize }.join(' ')
puts to_print
better = ''
words.split.each do |word|
  if !DO_NOT_CAPITALIZE.include?(word) && words.split.index(word) != 0
    better += word.downcase.capitalize + ' '
  else
    better += word + ' '
  end
end
puts better

# Q9
# -----
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, sub_hash|
  case sub_hash["age"]
  when (0..18)
    munsters[key].merge!({"age_group" => "kid"})
  when (18..65)
    munsters[key].merge!({"age_group" => "adult"})
  else
    munsters[key].merge!({"age_group" => "senior"})
  end
end

puts munsters

# Q10
# -----
