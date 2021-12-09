class School
  def initialize(input)
    initial = (0..8).reduce({}) { |memo, age|
      memo[age] = 0
      memo
    }
    @fish_by_age = input.reduce(initial) { |memo, age|
      memo[age] ? memo[age] += 1 : memo[age] = 1
      memo
    }
  end

  def age_a_day
    new_fish_by_age = (0..8).reduce({}) { |memo, age|
      memo[age] = 0
      memo
    }
    @fish_by_age.each { |k, v|
      if k == 0
        new_fish_by_age[6] += v
        new_fish_by_age[8] += v 
      else
        new_fish_by_age[k - 1] += v
      end
    }

    @fish_by_age = new_fish_by_age
  end

  def fish_count
    @fish_by_age.values.reduce(&:+)
  end
end

input = IO.readlines("6_input")[0].strip.split(",").map(&:to_i)

school = School.new(input)

256.times { school.age_a_day }

puts school.fish_count
