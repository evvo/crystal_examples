# Namespace
module AnnotationModule
  extend self
  # Annotation
  annotation Ageable
  end

  annotation ChangeParam
  end

  def initialize
    self.get_agable_vars
  end

  def get_agable_vars
    {% for ivar in @type.instance_vars.select { |ivar| ivar.annotation(Ageable) } %}
      pp "Age of #{@{{ ivar.id }}}: {{ ivar.annotation(Ageable)[:age] }}"
    {% end %}
  end
end

module AnnotationExample
  class User
    include AnnotationModule

    @[Ageable(age: 20)]
    @wine = "Merlot"

    # Property without annotation
    @name = "Joe"

    @[ChangeParam("wine", "Chardonnay")]
    def get_different_wine
      {% begin %}
        @{{ @def.annotation(ChangeParam)[0].id }} = {{ @def.annotation(ChangeParam)[1] }}
      {% end %}
    end
  end

  user = User.new
  user.get_different_wine
  user.get_agable_vars
end
