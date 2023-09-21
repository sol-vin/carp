module Carp
  {% if @top_level.has_constant? :Raylib %}
    alias AABB = Raylib::Rectangle
    alias Vector2 = Raylib::Vector2
    alias Color = Raylib::Color
  {% else %}
    struct Vector2
      x : LibC::Float
      y : LibC::Float
    end

    struct AABB
      x : LibC::Float
      y : LibC::Float
      width : LibC::Float
      height : LibC::Float
    end

    struct Color
      r : LibC::UChar
      g : LibC::UChar
      b : LibC::UChar
      a : LibC::UChar
    end
  {% end %}
end
