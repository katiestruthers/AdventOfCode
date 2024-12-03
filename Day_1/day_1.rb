# Setup

array1, array2 = [], []

File.foreach('input.txt') do |line|
  num1, num2 = line.split.map(&:to_i)
  array1 << num1
  array2 << num2
end

max = array1.length - 1

# Part 1

array1.sort!
array2.sort!

distance = 0

for index in 0..max
  distance += (array1[index] - array2[index]).abs
end

puts "Distance: #{distance}"

# Part 2

array1_instances = {}

for index in 0..max
  array1_instances[array1[index]] = 0
end

for index in 0..max
  key = array2[index]
  
  next if array1_instances[key].nil?

  array1_instances[key] += 1
end

similarity_score = 0

for index in 0..max
  num1 = array1[index]
  num2 = array1_instances[num1]

  similarity_score += num1 * num2
end

puts "Similarity Score: #{similarity_score}"