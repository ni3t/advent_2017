
lengths = DATA.each_line.first.split(?,).map(&:to_i)
list = (0..255).to_a
total = 0

class Array
  def twist_and_rotate(k, i)
    unshift(shift(k).reverse).flatten!.rotate!(k + i)
    self
  end
end

lengths.map.with_index do |k, i|
  list.twist_and_rotate(k, i)
  total += (k + i)
end

# part 1 answer
puts list.rotate!(total * -1).instance_eval { self[0] * self[1] }

chars = lengths.join(",").each_byte.to_a.concat([17, 31, 73, 47, 23])

list = (0..255).to_a
skip = 0.step
total = 0
64.times do
  chars.map do |k|
    j = skip.next
    list.twist_and_rotate(k, j)
    total += (k + j)
  end
end
list.rotate!(total * -1)

res = list.each_slice(16).map do |set|
  m, *rem = set
  rem.map do |i|
    m = m ^ i
  end
  m
end.map { |hx| hx.to_s(16).ljust(2, "0") }.join

# part 2 answer
puts res

__END__
94,84,0,79,2,27,81,1,123,93,218,23,103,255,254,243
