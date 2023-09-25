module Carp
  def self.jarvis_march(input : Vertices) : Vertices
    raise "Too few verticies #{input.size}" if input.size < 3

    lowest_index = 0

    (1..input.size).each do |i|
      lowest_index = i if input[lowest_index].x > input[i].x
    end

    output = Vertices.new
    output << input[lowest_index]

    current_index = lowest_index
    next_index = lowest_index

    loop do
      input.size.times do |i|
        next if i == current_index
        next_index = i
        break
      end

      input.size.times do |i|
        next if i == current_index || i == next_index
        # TODO: Implement Vector2CCW
      end
    end
  end
end