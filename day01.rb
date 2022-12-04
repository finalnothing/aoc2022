elves = [0]
File.read('input/day01.txt').lines.map(&:chomp).each do |line|
  next elves << 0 if line.empty?
  elves[-1] += line.to_i
end

puts elves.max
puts elves.sort.reverse.take(3).sum
