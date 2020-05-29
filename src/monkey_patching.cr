class User
  property name : String = ""

  def initialize(@name)
  end
end

# Make Array Elements unique by name property
# Be careful, as that is the Array(T) class used by everything else
class Array(T)
  @@user_names = Set(String).new

  # No exact overloading, as the original method is
  # of type <<(value : T)
  # def <<(value : User)
  #   if @@user_names.includes?(value.name)
  #     raise "Not Unique Name"
  #   end

  #   @@user_names.add(value.name)

  #   self.push(value)
  # end

  # Exact overloading of the method
  def <<(value : T)
    # In that case we need to use macro, as these types are available
    # at compile time
    {% if @type.type_vars.first == User %}
      if @@user_names.includes?(value.name)
        raise "Not Unique Name"
      end

      @@user_names.add(value.name)
    {% end %}

    previous_def # Previous definition - the original definition
  end

  # Note: There are other variations of the delete_at method
  # with different parameters
  def delete_at(index : Int)
    {% if @type.type_vars.first == User %}
      @@user_names.delete(self[index].name)
    {% end %}

    previous_def
  end
end

users = [] of User

user1 = User.new "Peter"
user2 = User.new "Joe"
user3 = User.new "Joe"

users << user1
users << user2
users.delete_at(1) # if it is not deleted, it will throw exception
users << user3

pp users
