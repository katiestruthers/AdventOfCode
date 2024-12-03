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

distance = array1.zip(array2).sum { |a, b| (a - b).abs }

puts "Distance: #{distance}"

# Part 2

array1_instances = Hash.new(0)

array2.each { |key| array1_instances[key] += 1 if array1.include?(key) }

similarity_score = array1.sum { |num1| num1 * array1_instances[num1] }

puts "Similarity Score: #{similarity_score}"