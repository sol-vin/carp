module Carp
  struct Transform
    property position : Vector2 = Vector2.new
    property rotation : Rotation = Rotation.new
    property angle : Float32 = 0.0_f32

    struct Rotation
      property sin : Float32 = 0.0_f32
      property cos : Float32 = 0.0_f32
    end
  end
end