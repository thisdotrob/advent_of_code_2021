start_positions = IO.readlines("7_input")[0].strip.split(",").map(&:to_i)

movement_costs = {}
alignment_costs = {}

alignment_positions = (start_positions.min..start_positions.max).to_a

alignment_positions.each { |alignment_position|
  if !alignment_costs[alignment_position]
    alignment_costs[alignment_position] = start_positions.reduce(0) { |memo, position|
      sorted_positions = [alignment_position, position].sort
      movement_k = "#{sorted_positions[0]}->#{sorted_positions[1]}"
      if !movement_costs[movement_k]
        movement_costs[movement_k] = sorted_positions[1] - sorted_positions[0]
      end
      memo + movement_costs[movement_k]
    }
  end
}

puts alignment_costs.values.min
