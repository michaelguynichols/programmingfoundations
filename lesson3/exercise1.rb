# Q1
# -----
# I would expect [1, 2, 3]

# Q2
# -----
# 1. != means not equal to. You use it to test inequality.
# 2. ! before something means not or opposite of.
# 3. ! after something means it will cause mutation or destruction.
# 4. ? before means ternary operator.
# 5. !! to turn something into the boolean equivalent.

# Q3
# -----
advice = "Few things in life are as important as house training your pet dinosaur."
advice.sub!("important", "urgent")
puts advice

# Q4
# -----
# numbers.delete_at(1) deletes whatever is at index 1 in the array.
# numbers.delete(1) deletes 1 wherever it appears in the array.

# Q5
# -----
ten = 10
hundred = 100
puts (ten..hundred).include?(42)

# Q6
# -----
famous_words = "seven years ago..."
famous_words.prepend("Four score and ")
puts famous_words
famous_words1 = "seven years ago..."
finished_famous = "Four score and " << famous_words1
puts finished_famous

# Q7
# -----
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

puts eval(how_deep)

# Q8
# -----
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
flintstones.flatten!
p flintstones

# Q9
# -----
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.assoc("Barney")

# Q10
# -----
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hashed_flint = {}
flintstones.each_with_index do |name, index|
  hashed_flint[name] = index
end
p hashed_flint
