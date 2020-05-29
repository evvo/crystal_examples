require "jsonable"
require "kemal"

Kemal.config.powered_by_header = false

class Product
  include Jsonable
  include JSON::Serializable
  property name : String
  getter price = 100
  getter addedBy = "Admin"

  public_json_fields [["name", "price"]]

  def initialize(@name : String)
  end

  def initialize(@name, @price)
  end
end

class User
  include JSON::Serializable
  include Jsonable
  property products = [] of Product
  property name = ""

  public_json_fields [["name", "products"]]

  def initialize
  end

  def initialize(@name, @products)
  end
end

users = [
  User.new("Peter", [Product.new("Shoes"), Product.new("Jacket")]),
  User.new("Jane", [Product.new("Laptop", 500), Product.new("Phone")]),
  User.new("Dave", [Product.new("Fish"), Product.new("Phone")]),
]

# Middleware
before_all "/api/*" do |env|
  env.response.content_type = "application/json"
end

error 404 do
  "Route Not Found".to_json
end

macro resource_not_found(env)
  halt env, status_code: 404, response: "Resource Not Found".to_json
end

macro unprocessable_entity(env)
  halt env, status_code: 422, response: "Unprocessable Entity".to_json
end

get "/api/user/by-name/:name" do |env|
  name = env.params.url["name"]
  filtered_users = users.select do |user|
    user.name == name
  end

  if filtered_users.size > 0
    next filtered_users.first.get_json
  end

  resource_not_found(env)
end

get "/api/user/by-product/:product" do |env|
  product_name = env.params.url["product"]

  User.get_json_collection(users.select do |user|
    user.products.select do |product|
      product.name == product_name
    end.size > 0
  end)
end

post "/api/user/create" do |env|
  begin
    body = env.request.body.as(IO).gets_to_end
    user = User.from_json(body)
    users << user

    user.get_json
  rescue
    unprocessable_entity(env)
  end
end

Kemal.run
