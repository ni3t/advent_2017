testmode = ARGV.delete("-t")
verbose = ARGV.delete("-v")

input = testmode ? [65, 8921] : [618, 814]

a, b = input

afac = 16807
bfac = 48271
div = 2 ** 31 - 1

i = 0
40_000_000.times do |k|
  a = a * afac % div
  b = b * bfac % div
  i += 1 if a & 0xffff == b & 0xffff
end
puts i

a, b = input
j = 0
5_000_000.times do
  a = a * afac % div
  a = a * afac % div until a % 4 == 0
  b = b * bfac % div
  b = b * bfac % div until b % 8 == 0
  j += 1 if a & 0xffff == b & 0xffff
end
puts j

__END__
