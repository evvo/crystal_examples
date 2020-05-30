module RadioReceive
  property receive = true

  def receive_message(message)
    puts "Receiving message #{message}"
  end
end

module RadioTransmit
  property transmit = true

  def transmit_message(message)
    puts "Transmitting message #{message}"
  end
end

class Cell
  @location = "Plovdiv, Center"
end

class Phone
  include RadioReceive
  include RadioTransmit
end

class FmReceiver
  include RadioReceive
end

phone = Phone.new
phone.receive_message "Phone is receiving!"
phone.transmit_message "Phone is receiving!"

fm_radio = FmReceiver.new
fm_radio.receive_message "FM Radio is receiving!"