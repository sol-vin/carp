class Carp::Body
  enum Type
    Unknown
    Static
    Kinematic
    Dynamic
  end

  @[Flags]
  enum Flag
    None            = 0
    InfiniteMass    = 1
    InfiniteInertia = 2
  end

  getter type : Type = Type::Unknown
  getter flags : Flag = Flag::None
  getter shape : Shape = Shape.new
  getter tx : Transform = Transform.new
  getter motion = Motion.new
  getter aabb = AABB.new

  def initialize(@type : Type, @position : Vector2)
    @tx.position = position

    @tx.rotation.sin = 0.0_f32
    @tx.rotation.cos = 1.0_f32

    @motion.gravity_scale = 1.0_f32
  end

  def initialize(@type : Type, @position : Vector2, @shape : Shape)
    tx.position = position

    tx.rotation.sin = 0.0_f32
    tx.rotation.cos = 1.0_f32

    motion.gravity_scale = 1.0_f32
  end

  def contains_point?(point : Vector2) : Bool
    if shape.is_a?(Shape::Circle)
      d_x = point.x - tx.position.x
      d_y = point.y - tx.position.y
      radius = shape.as(Shape::Circle)
      (d_x * d_x) + (d_y * d_y) <= radius * radius
    elsif shape.is_a?(Shape::Polygon)
      ray = Ray.new
      ray.origin = point
      ray.direction = Vector2.new(x: 1.0_f32, y: 0.0_f32)
      ray.max_distance = Float32::MAX

      result = ray.cast(self)
      result.inside
    else
      false
    end
  end
end