class Position
  attr_reader :position
  def initialize
    @position = [0,0,0]
  end

  def forward(n)
    horizontal = @position[0]
    depth = @position[1]
    aim = @position[2]
    @position[0] = horizontal + n
    @position[1] = depth + (aim * n)
  end

  def down(n)
    aim = @position[2]
    @position[2] = aim + n
  end

  def up(n)
    aim = @position[2]
    @position[2] = aim - n
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

