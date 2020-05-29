lib C
  # In C: double cos(double x)
  fun cos(value : Float64) : Float64
end

pp C.cos(1.5)

# First, build an object file:
# gcc -c -g src/to_be_binded.c
@[Link(ldflags: "#{__DIR__}/../to_be_binded.o")]
lib SimpleMath
  fun sum_numbers(number1 : Int32, number2 : Int32) : Int32
  fun subtract_numbers(number1 : Int32, number2 : Int32) : Int32
  fun print_array_items(numbers : StaticArray(Int32, 5)) # Only Static array is supported
end

pp SimpleMath.sum_numbers(1, 2)
pp SimpleMath.subtract_numbers(5, 4)
SimpleMath.print_array_items(StaticArray[8, 3, 99, 100, 4])
