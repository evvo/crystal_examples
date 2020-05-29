# Namespace
module AnnotationModule
  extend self
  # Annotation
  annotation Ageable
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
  end

  user = User.new
end
