input = (ARGV.empty? ? DATA : ARGF).read.split.map(&:to_i)

seen = {input.dup => 0}
puts 1.step { |n|
  max = input.max
  start = input.index(max)
  input[start] = 0
  max.times { |i| input[(start + 1 + i) % input.size] += 1 }
  break [n, n - seen[input]] if seen.has_key?(input)
  seen[input.dup] = n
}

__END__
10	3	15	10	5	15	5	15	9	2	5	8	5	2	3	6
