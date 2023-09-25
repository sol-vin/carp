module Carp
  {% if @top_level.has_constant? :Raylib %}
    alias AABB = Raylib::Rectangle
    alias Vector2 = Raylib::Vector2
    alias Color = Raylib::Color
  {% else %}
    struct Vector2
      x : Float32
      y : Float32
    end

    struct AABB
      x : Float32
      y : Float32
      width : Float32
      height : Float32
    end

    struct Color
      r : UInt8
      g : UInt8
      b : UInt8
      a : UInt8
    end
  {% end %}
end
