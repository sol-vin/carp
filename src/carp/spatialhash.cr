class Carp::SpatialHash
  record(Key, x : Int32 = 0, y : Int32 = 0)

  getter cell_size : Float
  getter inverse_cell_size : Float
  # getter query_result : Array(Int32)
  getter entries : Hash(Key, Array(Int32))

  def initialize(@cell_size)
    raise "Invalid cell_size #{@cell_size}" if @cell_size < 0
    @inverse_cell_size = 1.0_f32 / @cell_size
  end

  def clear
    entries.values.each(&.clear)
  end

  def insert(key : AABB, value : Int32)
    min_x = key.x * inverse_cell_size
    min_y = key.y * inverse_cell_size
    max_x = (key.x + key.width) * inverse_cell_size
    max_y = (key.y + key.height) * inverse_cell_size

    (min_y...max_y).times do |y|
      (min_x...max_x).times do |x|
        key = Key.new(x: x, y: y)
        if entry = entries[key]?
          entry << value
        else
          entries[key] = [value]
        end
      end
    end
  end

  def [](key : AABB) : Tuple(Int32)
    query_result = [] of Int32
    min_x = key.x * inverse_cell_size
    min_y = key.y * inverse_cell_size
    max_x = (key.x + key.width) * inverse_cell_size
    max_y = (key.y + key.height) * inverse_cell_size
    
    (min_y...max_y).times do |y|
      (min_x...max_x).times do |x|
        key = Key.new(x: x, y: y)
        if entry = entries[key]?
          entry.each_with_index do |e, i|
            query_result << e[i] #eio
          end
        else
          next
        end
      end
    end

    Tuple(Int32).from query_result.sort.uniq
  end
end