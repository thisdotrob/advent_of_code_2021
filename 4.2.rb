input = IO.readlines("4_input").map { |line| line.strip }

numbers = input[0].split(",")

class Board
  attr_reader :state

  def initialize(str)
    @state = str.split.map { |elem| elem.strip }
  end

  def mark_off(number)
    @state = @state.map { |board_number|
      board_number == number ? nil : board_number
    }
  end

  def rows
    [
      @state[0,5],
      @state[5,5],
      @state[10,5],
      @state[15,5],
      @state[20,5],
    ]
  end

  def cols
    (0..4).map { |i|
      [0,5,10,15,20].map { |i2|
        @state[i2 + i]
      }
    }
  end

  def won?
    rows.any? { |row| row.all? { |elem| elem.nil? }} || 
    cols.any? { |col| col.all? { |elem| elem.nil? }} 
  end

  def final_score(number)
    non_nils = @state.filter { |n| !n.nil? }
    non_nils = non_nils.map(&:to_i)
    sum = non_nils.reduce(&:+)
    sum * number.to_i
  end
end

boards = []

boards_input = input[2,input.length - 2]
boards_input << ''

in_progress = ' '

boards_input.each { |line|
  if line == ''
    boards << Board.new(in_progress)
    in_progress = ' '
  else
    in_progress << " #{line}"
  end
}

i = -1

while boards.length > 1
  i += 1
  number = numbers[i]
  boards.each { |board| board.mark_off(number) }
  boards = boards.filter { |board| !board.won? }
end

last_to_win = boards[0]

while !last_to_win.won?
  i += 1
  number = numbers[i]
  last_to_win.mark_off(number)
end

puts last_to_win.final_score(numbers[i])
