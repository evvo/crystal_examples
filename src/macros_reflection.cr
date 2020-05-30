macro generate_empty_classes(classes)
  {% for empty_class in classes %}
    class {{empty_class}}
    end
  {% end %}
end

generate_empty_classes [AdminLevel, GreenColor]

# class GreenColor
# end

# class AdminLevel
# end

class User(Color, Level)
  @name = "Peter"
  @age = 23
  @location = "London"

  @@class_property_name = "TheUser"

  def instance_properties # Instance properties
    # Evaluated at compile time
    # Careful as this might return an empty array without a type - []
    {{ @type.instance_vars.map &.name.stringify }}
  end

  def instance_methods # Instance methods
    # Evaluated at compile time
    # Careful as this might return an empty array without a type - []
    {{ @type.methods.map &.name.stringify }}
  end

  def type_variables # Generics
    # Evaluated at compile time
    # Careful as this might return an empty array without a type - []
    {{ @type.type_vars.map &.name.stringify }}
  end

  def self.class_methods
    # Get class methods (static methods)
    # Careful as this might return an empty array without a type - []
    {{ @type.class.methods.map &.name.stringify }}
  end

  def self.class_properties
    # Get class properties (static properties)
    # Careful as this might return an empty array without a type - []
    {{ @type.class_vars.map &.name.stringify }}
  end
end

user = User(GreenColor, AdminLevel).new
pp user.instance_properties
pp user.type_variables
pp user.instance_methods
pp User.class_methods
pp User.class_properties
