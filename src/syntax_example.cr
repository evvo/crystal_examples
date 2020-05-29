just_an_int = 100
just_a_float = 2.5
just_a_string : String = "This is a test String"

puts "Greetings, commander!"

def hello_world
  puts "Hello, World!"
end

hello_world

def hello_world(something)
  puts "Hello World, #{something}"
end

hello_world "Commander"

def hello_something(something)
  puts "Hello, #{something}"
end

hello_something "Joe"

# The last same overload wins
def hello_something(something)
  puts "Hello, #{something} 2"
end

hello_something "Joe"

class Product
  @name : String
  @picture : String
  @price : Int32 # 100 = 1.00

  def initialize(@price : Int32) # price is Int
    @name = "No Name"
    @picture = "http://example.com/no_image.jpg"
  end

  def initialize(@name : String) # name is String, so no overload
    @picture = "http://example.com/no_image.jpg"
    @price = 0 # Maybe free ?
  end

  def initialize(@name, @picture, @price)
  end

  protected def check_product
    puts "I am protected method"
  end

  private def privacy_check
    puts "I am private method"
  end
end

# product = Product.new(1, 2, 3, 4) # Won't work

product1 = Product.new "Shoes"
pp product1

product2 = Product.new 500
pp product2

product3 = Product.new "Shoes", "picture_url", 500
pp product3

class AvailableProduct < Product
end

available_product1 = AvailableProduct.new "Shoes"
pp typeof(available_product1)
pp available_product1

struct User
  @name = "MacLeod"
  @age = 400
end

pp User.new
pp User.new

class MultipleLambdas
  property lambdas = [] of Proc(Nil) # Pointer to function for function without parameters

  def initialize(@lambdas)
  end

  def start_all_lambdas!
    @lambdas.each do |lambda|
      pp "Starting lambda!"
      lambda.call
    end
  end
end

muliple_lambdas = MultipleLambdas.new [->hello_world, ->{ puts "I am anonymous" }, ->hello_world]
muliple_lambdas.start_all_lambdas!
