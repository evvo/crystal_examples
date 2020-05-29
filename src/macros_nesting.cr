macro create_keyboard_key_layout(keys, actions, default_max_force)
  @@actions = [] of String

  {% for key in keys %}
    macro key_{{key.id}}(max_force = default_max_force)
      {% for action in actions %}
        def self.{{key.id}}_{{action.id}}(force)
          \{% if max_force <= {{default_max_force}} %}
            @@actions << "{{key.id}}_{{action.id}}_#{force}"
          \{% else %}
            @@actions << "{{key.id}}_big_key_{{action.id}}_#{force}"
          \{% end %}
          pp @@actions
        end
      {% end %}
    end

    key_{{key.id}} {{default_max_force}}
  {% end %}
  
end

class Keyboard
  create_keyboard_key_layout [a, b, c, d], [up, down, touch], 255
  key_a 200
  key_b 200
  key_c 350
  key_d 1

  def self.class_methods
    # Get class methods (static methods)
    {{ @type.class.methods.map &.name.stringify }}
  end
end

Keyboard.a_up(100)
Keyboard.a_down(200)
Keyboard.a_up(100)

pp Keyboard.class_methods
