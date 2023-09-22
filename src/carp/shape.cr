abstract class Carp::Shape
  property material : Material = Material.new
  property area : Float32 = 0.0_f32
end

class Carp::Circle < Carp::Shape
  property radius : Float32 = 0.0_f32
end


class Carp::Polygon < Carp::Shape
  property vertices : Array(Vector2) = [] of Vector2
  property normals : Array(Vector2) = [] of Vector2
end