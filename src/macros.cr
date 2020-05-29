macro define_method(name, content)
  def {{name}}
      {{content}}
  end
end

# This generates:
#
#     def foo
#       1
#     end
define_method foo, 1

foo # => 1

pp foo

# Nillable initialization example
# macro create_class (name, properties)
#   class {{name}}
#     {% for property, type in properties %}
#       @{{ property.id }} : {{ type.id }}
#     {% end %}
#   end
# end

# create_class User, { name => String, age => Int32 }

# Correct example
macro create_class(name, properties)
  class {{name}}
    {% for property, type in properties %}
      @{{ property }} : ({{ type }} | Nil)
    {% end %}

    def initialize ({% for local_property in properties %}{{ local_property }},{% end %})
      {% for property, type in properties %}
        @{{ property }} = {{ property }}
      {% end %}
    end

    def initialize
    end
  end
end

create_class User, {name => String, age => Int32}

new_user = User.new "Joe", 45

pp new_user
