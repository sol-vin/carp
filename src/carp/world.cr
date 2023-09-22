class Carp::World
  # Defines the 'bias factor' for the Baumgarte stabilization scheme.
  BAUMGARTE_FACTOR = 0.24_f32

  # Defines the 'slop' for the Baumgarte stabilization scheme.
  BAUMGARTE_SLOP = 0.01_f32

  # Defines the default gravity acceleration vector for a world.
  DEFAULT_GRAVITY = Vector2.new(y: 9.8_f32)

  # Defines the iteration count for the constraint solver.
  ITERATION_COUNT = 10

  # Defines the maximum number of objects in a world.
  MAX_OBJECT_COUNT = 4096

  DEFAULT_CELL_SIZE = 4.0_f32


  property gravity : Vector2 = DEFAULT_GRAVITY
  getter spatial_hash : SpatialHash

  @bodies = [] of Body

  getter accumulator : Float64 = 0.0_f64
  getter timestamp : Float64 = 0.0_f64

  record(
    ContactCache,
    key : BodyPair,
    value : Collision
  )

  pre_step_hook = ->(cache : ContactCache) {false}
  post_step_hook = ->(cache : ContactCache) {false}


  @cache : Array(ContactCache) = [] of ContactCache

  def initialize(@gravity = DEFAULT_GRAVITY, cell_size = DEFAULT_CELL_SIZE)
    @spatial_hash = SpatialHash.new(cell_size)
  end

  def clear
    @bodies.clear
    @spatial_hash.clear
  end

  def pre_step
  end

  def step(delta_time : Float64)
    raise "Invalid delta_time: #{delta_time}" if delta_time < 0
  end

  def post_step
    pre_step

    @cache.size.times do |c|
      pre_step_hook.call(c)
    end

    #TODO: Implement BodyTOGravity

    post_step
  end

  def update
  end

  def <<(body : Body)
    bodies << body
  end

  def [](index : Int32)
    bodies[index]
  end

  def size
    bodies.size
  end

  def delete(body : Body)
    bodies.delete(body)
  end
end