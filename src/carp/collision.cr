struct Carp::Collision
  friction : Float32 = 0.0_f32
  restitution : Float32 = 0.0_f32
  direction : Vector2 = Vector2.new
  contacts : StaticArray(Contact, 2) = StaticArray(Contact, 2).new 
  count : Float32 = 0.0_f32

  struct Cache
    normal_mass : Float32 = 0.0_f32
    normal_scalar : Float32 = 0.0_f32
    tangent_mass : Float32 = 0.0_f32
    tangent_scalar : Float32 = 0.0_f32
  end

  struct Contact
    id : Int32 = 0_i32
    point : Vector2 = Vector2.new
    depth : Float32 = 0.0_f32
    cache : Cache = Cache.new
  end
end