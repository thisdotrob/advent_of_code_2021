class Position
  attr_reader :position
  def initialize
    @position = [0,0]
  end

  def forward(n)
    horizontal = @position[0]
    @position[0] = horizontal + n
  end

  def down(n)
    depth = @position[1]
    @position[1] = depth + n
  end

  def up(n)
    depth = @position[1]
    @position[1] = depth - n
  end
end

p = Position.new

input = IO.readlines("2_input") 

input.each { |line| 
  split = line.split
  command = split[0]
  n = split[1].to_i
  p.send(command, n)
}

puts p.position[0] * p.position[1]
