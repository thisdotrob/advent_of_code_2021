def gamma_rate(input)
  binary_rate = ''
  (0...input[0].strip.length).each { |i|
    ones = 0
    zeros = 0
    input.each { |line|
      char = line[i]
      ones += 1 if char == '1'
      zeros += 1 if char == '0'
    }
    ones > zeros ? binary_rate << '1' : binary_rate << '0' 
  }
  binary_rate.to_i(2)
end

def epsilon_rate(input)
  binary_rate = ''
  (0...input[0].strip.length).each { |i|
    ones = 0
    zeros = 0
    input.each { |line|
      char = line[i]
      ones += 1 if char == '1'
      zeros += 1 if char == '0'
    }
    ones > zeros ? binary_rate << '0' : binary_rate << '1' 
  }
  binary_rate.to_i(2)
end

input = IO.readlines("3_input") 

puts gamma_rate(input) * epsilon_rate(input)
