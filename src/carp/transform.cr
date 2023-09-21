module Carp
  struct Transform
    position : Vector2 = Vector2.new
    rotation : Rotation = Rotation.new
    angle : Float32 = 0.0_f32

    struct Rotation
      sin : Float32 = 0.0_f32
      cos : Float32 = 0.0_f32
    end
  end
end