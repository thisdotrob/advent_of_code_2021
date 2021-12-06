def calc_count (lines)
  prev_depth = nil
  
  count = 0

  lines.each { |l|
    depth = l.to_i
    count += 1 if prev_depth && depth > prev_depth
    prev_depth = depth
  }

  count
end

windows = []

a = IO.readlines("1_input") 

(0..a.length).each { |i|
  if i > 1
    prev = a[i-1].to_i
    prev_prev = a[i-2].to_i
    sum = prev + prev_prev + a[i].to_i
    windows << sum
  end
}

puts calc_count windows
