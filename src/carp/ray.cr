module Carp
  struct Ray
    origin : Vector2 = Vector2.new
    direction : Vector2 = Vector2.new
    max_distance : Float32 = 0.0_f32
    
    struct Hit
      body : Body
      point : Vector2 = Vector2.new
      normal : Vector2 = Vector2.new
      distance : Float32 = 0.0_f32
      inside : Bool
    end
  end
end