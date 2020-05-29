# Directly detected by the compiler
string_var = "I am a teapot"
int_var = 5

# Random select between stringVar and intVar
result = rand < 0.5 ? string_var : int_var

# Compiler detects that the property can be either a string or an integer
pp typeof(result) # (Int32 | String)

# Array with multiple types of elements
multi_array = ["I am a string", 5, Time]
pp typeof(multi_array) # Array(Int32 | String | Time.class)

string_or_int : (String | Int32) = "Testing String"
pp "string_or_int is: #{typeof(string_or_int)}"

string_or_int = 10
pp "string_or_int is: #{typeof(string_or_int)}"

string_or_int = "Testing String again"
pp "string_or_int is: #{typeof(string_or_int)}"

string_or_int = 20
pp "string_or_int is: #{typeof(string_or_int)}"

# Will throw a compiler error
# string_or_int = Time
# pp "string_or_int is: #{typeof(string_or_int)}"
