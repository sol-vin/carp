module Carp
  record(Motion,
    mass : Float32 = 0.0_f32,
    i_mass : Float32 = 0.0_f32,
    inertia : Float32 = 0.0_f32,
    i_inertia : Float32 = 0.0_f32,
    gravity_scale : Float32 = 0.0_f32,
    velocity : Vector2 = Vector2.new,
    angular_velocity : Float32 = 0.0_f32,
    force : Vector2.new,
    torque : Float32 = 0.0_f32
  )
end