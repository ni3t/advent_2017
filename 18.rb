V = ARGV.delete("-v")

TEST = <<TEST
set a 1
add a 2
mul a a
mod a 5
snd a
set a 0
rcv a
jgz a -1
set a 1
jgz a -2
TEST

REGISTERS = []

def fr(name)
  REGISTERS.find{|register| register.name == name}
end

LastBeep = Struct.new(:value)
LAST = LastBeep.new(nil)
RECOV = LastBeep.new(nil)
Register = Struct.new(:name, :value) do
  def snd(val)
    puts "BEEP #{self.value}" if V
    `play -n synth 0.05 sin #{[self.value,100].max}`
    LAST.value = self.value
    1
  end
  def set(val)
    val.to_i.to_s == val ? (self.value = val.to_i) : (self.value = fr(val).value.to_i)
    puts "setting #{name} to #{value} by set" if V
    1
  end
  def add(val)
    val.to_i.to_s == val ? (self.value += val.to_i) : (self.value += fr(val).value.to_i)
    puts "setting #{name} to #{value} by adding #{val}" if V
    1
  end
  def mul(val)
    val.to_i.to_s == val ? (self.value *= val.to_i) : (self.value *= fr(val).value.to_i)
    puts "setting #{name} to #{value} by multiplying by #{val}" if V
    1
  end
  def mod(val)
    val.to_i.to_s == val ? (self.value = value % val.to_i) : (self.value = value % fr(val).value.to_i)
    puts "setting #{name} to #{value} by mod #{val}" if V
    1
  end
  def rcv(val)
    if self.value > 0
      puts "recovering #{val}" if V 
      RECOV.value = LAST.value
    else
      puts "skipping recover, value is #{self.value}" if V
    end
    1
  end
  def jgz(val)
    if self.value > 0
      puts "jgz #{val} #{name}" if V
      return val.to_i
    else
      puts "skipping jump, value is #{self.value}" if V
      1
    end
  end
end

INSTRUCTIONS = []

INPUT = (ARGV.delete("-t") ? TEST : DATA).each_line.map(&:strip).map do |line|
  instr, reg, value = line.split(" ")
  if REGISTERS.find{|register| register.name == reg}.nil?
    REGISTERS << Register.new(reg, 0)
  end
  INSTRUCTIONS << [instr.to_sym,reg,value]
end

instruction = 0
i = 0
until instruction < 0 || instruction >= INSTRUCTIONS.length || RECOV.value
  instr, reg, val = INSTRUCTIONS[instruction]
  puts "#{LAST.value || "none"} | #{RECOV.value || "none"}" if V
  puts "#{i} #{REGISTERS.map(&:value)} #{instruction}: #{instr}, #{reg}, #{val}\n" if V
  instruction = instruction + fr(reg).send(instr, val)
  puts "-"*25 if V
  i += 1
end

puts RECOV.value


__END__
set i 31
set a 1
mul p 17
jgz p p
mul a 2
add i -1
jgz i -2
add a -1
set i 127
set p 464
mul p 8505
mod p a
mul p 129749
add p 12345
mod p a
set b p
mod b 10000
snd b
add i -1
jgz i -9
jgz a 3
rcv b
jgz b -1
set f 0
set i 126
rcv a
rcv b
set p a
mul p -1
add p b
jgz p 4
snd a
set a b
jgz 1 3
snd b
set f 1
add i -1
jgz i -11
snd a
jgz f -16
jgz a -19