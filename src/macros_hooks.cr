class User
  macro inherited
    puts "I, the User, was inherited by {{@type.name.id}}"
  end
end

class Admin < User
end

Admin.new


module ReuseMe
  macro included
    puts "I, the module, was included by {{@type.name.id}}"
  end
end

class ReUser
  include ReuseMe
end


class MissYou
  # Will be used for every method that is missing
  macro method_missing(call)
    puts "No method {{call.name.id}} with {{call.args.size}} arguments"
  end
end

missing = MissYou.new
missing.i_just_called_to_say "hello"