# note: this is a brute force method. very slow since it doesnt check divisors.
# a smarter way to do it would be to collect a set of modulo numbers that would "block" the
# comparison from even happening.

TEST = <<EOS
0: 3
1: 2
4: 4
6: 4
EOS

testmode = ARGV.delete("-t")

input = (testmode ? TEST : DATA).each_line.map do |line|
  a, b = line.chomp.split(":").map(&:chomp).map(&:to_i)
end.to_h.freeze

max = input.keys.max
j = 0
loop do
  severity = 0
  (0..max).map do |i|
    range = input[i] || 0
    cycle = (range - 1) * 2
    next if cycle == 0
    if (i + j) % cycle == 0
      severity += (i * range)
    end
  end
  puts severity if j == 0
  first_cycle = (input[0] - 1) * 2
  if severity == 0 && j % first_cycle != 0
    puts j
    break
  end
  j += 1
end

__END__
0: 3
1: 2
2: 6
4: 4
6: 4
8: 8
10: 9
12: 8
14: 5
16: 6
18: 8
20: 6
22: 12
24: 6
26: 12
28: 8
30: 8
32: 10
34: 12
36: 12
38: 8
40: 12
42: 12
44: 14
46: 12
48: 14
50: 12
52: 12
54: 12
56: 10
58: 14
60: 14
62: 14
64: 14
66: 17
68: 14
72: 14
76: 14
80: 14
82: 14
88: 18
92: 14
98: 18
