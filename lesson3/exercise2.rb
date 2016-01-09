# Q1
# -----
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts ages.include?("Spot")

# Q2
# -----
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
age_sum = 0
# ages.values.inject(:+)
ages.each { |k, v| age_sum += v }
puts age_sum

# Q3
# -----
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.delete_if { |k, v| v > 100 }
puts ages

# Q4
# -----
munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.capitalize
puts munsters_description.swapcase
puts munsters_description.downcase
puts munsters_description.upcase

# Q5
# -----
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
puts ages

# Q6
# -----
mininum_age = ages.values.min
puts mininum_age

# Q7
# -----
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.match("Dino")

# Q8
# -----
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
index = flintstones.index { |name| name.start_with?("Be") }
puts index

# Q9
# -----
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |name| name[0, 3] }
p flintstones

# Q10
# -----
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |name| name[0, 3] }
p flintstones
