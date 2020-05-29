# Macros can be included and used in context
macro define_name
  property name : String = {{ @type.stringify }}
end

class Book
  define_name
end

module Catalogue
  class Book
    define_name
  end

  class Fruit
    define_name
  end

  class Tool
    define_name
  end
end

simple_book = Book.new
pp simple_book

namespaced_book = Catalogue::Book.new
pp namespaced_book
