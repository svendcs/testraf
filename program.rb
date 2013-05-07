arr = Array.new(100000, 2)

sleep 0.615

for i in 1..100000 do
  arr[i] = i
end
puts arr[10]