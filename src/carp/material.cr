module Carp
  record(
    Material, 
    density : Float32 = 0.0_f32, 
    friction : Float32 = 0.0_f32,
    restitution : Float32 = 0.0_f32
  )
end