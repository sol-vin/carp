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
end