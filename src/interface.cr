# Macro for defining abstract getter and setter
macro abstract_property(name, type)
  abstract def {{name}}=(name : {{type}})
  abstract def {{name}} : {{type}}
end

# Interface and "Abstract Class"
module Userable
  @level = "user"
  class_property userable_static = "userable_static"

  # same as
  # def self.userable_static
  #   @@userable_static
  # end
  #
  # def self.userable_static=(userable_static)
  #   @@userable_static = userable_static
  # end

  abstract def make_payment : Bool

  abstract_property name, String
end

module Loggable
  abstract def login : Bool
end

class Account
  include Userable
  include Loggable

  property name : String

  def initialize(@name)
  end

  def login : Bool
    true
  end

  def make_payment : Bool
    raise "Insufficient amount"
  end
end

class Admin
  include Userable
  include Loggable

  @level = "admin"
  property name : String

  def initialize(name)
    @name = name
  end

  def login : Bool
    false
  end

  def make_payment : Bool
    true
  end
end

class Product
  @name = "SomeProduct"
end

class Order
  @user : Userable
  @products : Array(Product)

  def initialize(user, products)
    @user = user
    @products = products
    Userable.userable_static = user.name
  end

  def collect_payment
    pp "once"
    @user.make_payment
  rescue
    pp "Cannot Make Payment"
  end
end

user = Account.new "John"
admin = Admin.new "Jane"
products = [Product.new, Product.new]

pp "UserableStatic is #{Userable.userable_static}"
order1 = Order.new user, products
pp "UserableStatic is #{Userable.userable_static}"
order2 = Order.new admin, products
pp "UserableStatic is #{Userable.userable_static}"

pp order1
pp order2
pp "Making Payment with #{order1} :", order1.collect_payment
pp "Making Payment with #{order2} :", order2.collect_payment
