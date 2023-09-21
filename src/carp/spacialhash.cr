class Carp::SpacialHash
  record(Key, x : Int32 = 0, y : Int32 = 0)

  getter cell_size : Float
  getter inverse_cell_size : Float
  getter query_result : Array(Int32)
  getter entries : Hash(Key, Array(Int32))

  def initialize(cell_size)
    raise "Invalid cell_size #{cell_size}" if cell_size < 0
    @cell_size = cell_size
    @inverse_cell_size = 1.0_f32 / cell_size
  end

  def clear
  end

  def <<(key : AABB, value : Int32)
  end

  def [](aabb : AABB)
    key = Key.new(x: x, y)
    entry = entries[key]
  end
end