prev_depth = nil

count = 0

IO.foreach("1_input") { |line| 
  depth = line.to_i
  count += 1 if prev_depth && depth > prev_depth
  prev_depth = depth
}

puts count
