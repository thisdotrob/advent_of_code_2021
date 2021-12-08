class Point
  attr_reader :x
  attr_reader :y

  def initialize(str)
    coords = str.split(',')
    @x = coords[0].tr(',', '').to_i
    @y = coords[1].tr(',', '').to_i
  end

  def to_sym
    "#{@x},#{@y}".to_sym
  end
end

class Line
  def initialize(end_point_1, end_point_2)
    @end_points = [end_point_1, end_point_2]
  end

  def horizontal?
    @end_points[0].y == @end_points[1].y
  end

  def vertical?
    @end_points[0].x == @end_points[1].x
  end

  def points
    if horizontal?
      sorted = @end_points.sort { |a, b| a.x <=> b.x }
      y = sorted[0].y
      start_x = sorted[0].x
      end_x = sorted[1].x
      return (start_x..end_x).map { |x|
        Point.new("#{x},#{y}")
      }
    end

    if vertical?
      sorted = @end_points.sort { |a, b| a.y <=> b.y }
      x = sorted[0].x
      start_y = sorted[0].y
      end_y = sorted[1].y
      return (start_y..end_y).map { |y|
        Point.new("#{x},#{y}")
      }
    end
  end
end

class Diagram
  def initialize(input)
    all_lines = input.map { |input_line|
      start_point = Point.new(input_line.split[0])
      end_point = Point.new(input_line.split[2])
      Line.new(start_point, end_point)
    }
    @lines = all_lines.filter { |line|
      line.horizontal? || line.vertical?
    }
  end

  def coverage
    @lines.reduce({}) { |memo, line|
      line.points.each { |point|
        if memo[point.to_sym]
          memo[point.to_sym] += 1
        else 
          memo[point.to_sym] = 1
        end
      }
      memo
    }
  end
end

input = IO.readlines("5_input").map { |line| line.strip }

diagram = Diagram.new(input)

overlapped_points_count = 0

diagram.coverage.each { |point, count|
  overlapped_points_count += 1 if count > 1
}

puts overlapped_points_count
