def most_common(input, i)
  ones = 0
  zeros = 0
  input.each { |line|
    char = line[i]
    ones += 1 if char == '1'
    zeros += 1 if char == '0'
  }
  ones >= zeros ? '1' : '0'
end

def rating(input, comparison_operator)
  remaining = []
  input.each { |line|
    remaining << line
  }
  i = -1
  while remaining.length > 1 do
    i += 1
    filter_char = most_common(remaining, i)
    remaining = remaining.filter { |line| 
      line[i].send(comparison_operator, filter_char)
    }
  end
  remaining[0].to_i(2)
end

def oxygen_generator_rating(input)
  rating(input, '==')
end

def co2_scrubber_rating(input)
  rating(input, '!=')
end

input = IO.readlines("3_input") 

puts oxygen_generator_rating(input) * co2_scrubber_rating(input)
