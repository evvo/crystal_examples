# DiskSlots, MemorySlots and Ports are generics
class Computer(DiskSlots, MemorySlots, Ports)
  @disk_slots = [] of DiskSlots
  @memory_slots = [] of MemorySlots
  @ports = [] of Ports
  @cpu = "ARMenDtel"

  def initialize(@disk_slots, @memory_slots, @ports)
  end
end

class Sata3
end

class Ddr4
end

class Usb3
end

my_computer = Computer(Sata3, Ddr4, Usb3).new [Sata3.new], [Ddr4.new, Ddr4.new], [Usb3.new]
pp my_computer
