module Carp
  struct Ray
    property origin : Vector2 = Vector2.new
    property direction : Vector2 = Vector2.new
    property max_distance : Float32 = 0.0_f32
    
    struct Hit
      property body : Body
      property point : Vector2 = Vector2.new
      property normal : Vector2 = Vector2.new
      property distance : Float32 = 0.0_f32
      property inside : Bool
    end
  end
end