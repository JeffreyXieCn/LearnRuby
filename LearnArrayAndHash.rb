hash1 = {abc: 'hello', 'another_key' => 123, 4567 => 'third'}
array1 = hash1.keys.map(&:to_s).sort_by(&:length) #keys returns an array
puts array1.inspect

array2 = hash1.keys.collect(&:to_s).sort_by{|key| key.length}
puts array2.inspect

arr1 = [1,2,3,4]
# This will print 2,4,6,8 but will return [1,2,3,4]
p arr1.each {|x| puts x*2; x*2 }
p arr1

arr2 = [1,2,3,4]
# This will also print 2,4,6,8 but returns [2,4,6,8]
p arr2.map {|x| puts x*2; x*2 } #[2, 4, 6, 8]
p arr2 #[1, 2, 3, 4]

arr_to_compact = [nil,123,nil,"test"]
p arr_to_compact.compact
p arr_to_compact

upcased = ["one", "two", "three"].map {|n| puts n.upcase }
p upcased

words = %w[this is a test] # Same as: ['this', 'is', 'a', 'test']
p words
white = %W(\s \t \r \n) # Same as: ["\s", "\t", "\r", "\n"]
p white

a = ('a'..'e').to_a # Range converted to ['a', 'b', 'c', 'd', 'e']
p a[-2, 2]
print 'A randomly generated domain: ', ('a'..'z').to_a.shuffle[0..7].join

puts
dupArr = [1, 1, 2, 2, 3, 3, 4]
p dupArr.uniq

hash2 = {two: "2", one: "1", three: "3"}
hash3 = {one: "1", three: "3", two: "2"}
p hash3.equal? hash2 #false
p hash3 == hash2 #true

p hash3
puts hash3.to_s

p ('a'..'z').step(2).to_a.join

arr3 = [1,2,3,4,2,6,5,6]
arr4 = [2,4,3,1,3,7]

p arr3 + arr4
p arr3 - arr4 #[6,5,6]
p arr3 & arr4 # duplicates removed
p arr3 | arr4 # duplicates removed