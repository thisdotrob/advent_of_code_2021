class Fish
  attr_reader :timer
  alias :age :timer 

  def initialize(timer_val = 8)
    @timer = timer_val
  end

  def age_a_day
    create_new_fish = @timer == 0
    @timer == 0 ? @timer = 6 : @timer -= 1
    create_new_fish
  end
end

class School
  def initialize(input_str)
    @fish = input_str.split(",").map { |timer_val| Fish.new(timer_val.to_i) }
  end

  def age_a_day
    new_fish = @fish.filter(&:age_a_day).map { Fish.new }
    @fish.concat(new_fish)
  end

  def fish_count
    @fish.length
  end

  def ages
    @fish.map(&:age)
  end
end

input = IO.readlines("6_input")[0].strip

school = School.new(input)

80.times { school.age_a_day }

puts school.fish_count
