alias StringCollection = Array(String) |
                         Hash(String, String)

def print_collection(collection : StringCollection)
  collection.each_with_index do |item, index|
    pp "Index: #{index}, Item: #{item.is_a?(Tuple) ? item.first? : item}"
  end
end

collection1 : StringCollection = ["Item1", "Item2"]
print_collection(collection1)

collection2 : StringCollection = {"item1" => "item1Val", "item2" => "item2Val"}
print_collection(collection2)

alias RecursiveAlias = Array(RecursiveAlias) |
                       String

recursive1 : RecursiveAlias = ["Testing".as(RecursiveAlias), "Testing2".as(RecursiveAlias)]
pp typeof(recursive1)
