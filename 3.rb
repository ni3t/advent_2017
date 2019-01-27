verbose = ARGV.delete("-v")
input = (ARGV.delete("-t") ? 23 : ARGV.any? ? ARGV.last : 368078).to_i

# 37  36  35  34  33  32  31  56
# 38  17  16  15  14  13  30  55
# 39  18   5   4   3  12  29  54
# 40  19   6   1   2  11  28  53
# 41  20   7   8   9  10  27  52
# 42  21  22  23  24  25  26  51
# 43  44  45  46  47  48  49  50

#   8               16                              24                                              32
# * *               *                               *                                               *
#                   1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 5 5 5 5 5 5 5 5 5 5 5
# 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0
# 0 1 2 1 2 1 2 1 2 3 2 3 4 3 2 3 4 3 2 3 4 3 2 3 4 5 4 3 4 5 6 5 4 3 4 5 6 5 4 3 4 5 6 5 4 3 4 5 6 7 6 5 4 5 6 7 8 7 6 5
# 0 (1..2)          (2..4)                          (3..6)                                          (4..8)

basis = input - 2

i = 1
j = i * 8
k = basis.dup

until k < j
  k = k - j
  i += 1
  j = i * 8
end

looper = (i..i * 2).to_a.concat((i + 1..i * 2 - 1).to_a.reverse).rotate(i + 1)
# puts looper.cycle(i * 2).to_a[k]

# 147  142  133  122   59
# 304    5    4    2   57  2065
# 330   10    1    1   54  1954
# 351   11   23   25   26  1862
# 362  747  806  854  905   931

prev_ring = [1, 2, 4, 5, 10, 11, 23, 25]
ring = 2
until ring == 3
  puts "ring=#{ring}"
  ring_members = (ring * 8).times.map { nil }
  puts "ring_members=#{ring_members}"
  puts "-" * 25
  sides = [?R, ?U, ?L, ?D]
  ring_members.each.with_index do |member, index|
    puts "ring member at #{index}"

    look_back = ring_members[index - 1]
    puts "I look back and see #{look_back || "nothing"}"

    puts "I should look in and two diagonals."
    puts "I'll create "

    puts "-" * 25
  end
  puts "#{ring_members}"
  ring += 1
end
