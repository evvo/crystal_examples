channel = Channel(String).new

spawn do
  puts "Before send"
  sleep 5
  channel.send("channel_message 1")
  puts "After send"
end

puts "Before receive"
pp channel.receive
puts "After receive"
