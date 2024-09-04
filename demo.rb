arr = [
  [1, 2, 3],
  [4, 4, 6],
  [7, 8, 9]
]

output = []

3.times do |col|
  3.times do |row|
    output.push(arr[col][row])
  end
end

p output