# Run with preview_mt flag (0.34.0)
# crystal run -Dpreview_mt src/multithreading.cr

def uppercase_string(name)
  name.upcase
end

names = ["Jason", "Peterson", "Jane", "Garry", "Tina", "Rowen", "Simon"]

channel = Channel(String).new(names.size)

names.each do |value|
  spawn { channel.send uppercase_string(value) }
end

results = Array.new(names.size) { channel.receive }

pp results
