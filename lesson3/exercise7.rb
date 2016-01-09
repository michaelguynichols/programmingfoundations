# Q1
# -----
# nil, referenced inside a local scope

# Q2
# -----


# Q3
# -----
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# Q4
# -----
lows = ("a".."f").to_a
nums = (0..9).to_a
ALL = (lows + nums).flatten

def UUID()
  first_eight = []
  8.times { |_| first_eight << ALL.sample }
  first_eight << '-'
  first_four = []
  4.times { |_| first_four << ALL.sample }
  first_four << '-'
  second_four = []
  4.times { |_| second_four << ALL.sample }
  second_four << '-'
  third_four = []
  4.times { |_| third_four << ALL.sample }
  third_four << '-'
  last_twelve = []
  12.times { |_| last_twelve << ALL.sample }
  final = (first_eight + first_four + second_four + third_four + last_twelve).join()
  final
end

p UUID()

# Q5
# -----
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break if !is_a_number?(word)
  end
  return true
end

puts dot_separated_ip_address?("4.5.5")

# Q6
# -----


# Q7
# -----


# Q8
# -----


# Q9
# -----


# Q10
# -----
