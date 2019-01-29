verbose = ARGV.delete("-v")
testmode = ARGV.delete("-t")

TEST = "flqrgnkx"

input = (testmode ? TEST : DATA).each_line.first.chomp

class Array
  def twist_and_rotate!(k, i)
    unshift(shift(k).reverse).flatten!.rotate!(k + i)
    self
  end
end

class String
  def to_knot_hash
    list = (0..255).to_a
    skip = 0.step
    total_rotations = 0
    bytes = each_byte.to_a.concat([17, 31, 73, 47, 23])
    64.times do
      bytes.map do |k|
        j = skip.next
        list.twist_and_rotate!(k, j)
        total_rotations += (k + j)
      end
    end
    list.rotate!(total_rotations * -1)
    res = list.each_slice(16).map do |set|
      m, *rem = set
      rem.map do |i|
        m = m ^ i
      end
      m
    end.map { |hx| hx.to_s(16).ljust(2, "0") }.join
    res
  end

  def to_knot_row
    to_knot_hash.split("").map { |char| char.to_i(16).to_s(2).rjust(4, "0") }.join("").split("").map(&:to_i)
  end
end

GRID = Array.new(128) { |y| "#{input}-#{y}".to_knot_row }

puts GRID.map { |row| row.map { |cell| cell == 0 ? "." : "#" }.join("") }.join("\n") if verbose

puts GRID.map { |row| row.sum }.sum

GROUPS = []
Group = Struct.new(:cells)

GRID.map.with_index do |row, y|
  row.map.with_index do |cell, x|
    if cell == 1
      if y == 0
        if x == 0
          GROUPS << Group.new([[x, y]])
        else
          if row[x - 1] == 1
            GROUPS.find { |g| g.cells.include?([x - 1, y]) }.cells << [x, y]
          else
            GROUPS << Group.new([[x, y]])
          end
        end
      else
        if GRID[y - 1][x] == 1
          if row[x - 1] == 1 && x != 0
            puts "looking at x=#{x} y=#{y}" if verbose
            #       .####.####.#.##.###......#
            #       #.##.#.#..######.#.######.
            #       ##.##.#..#.....##.##.....#
            #       ##.#.....##.#..##.#..#####
            #       .#.###.##...###..#.#...##.
            #       ##..#.######.###...#..##
            pp GROUPS if verbose
            g1 = GROUPS.find { |g| g.cells.include?([x - 1, y]) }
            g2 = GROUPS.find { |g| g.cells.include?([x, y - 1]) }
            if g1 == g2
              g1.cells << [x, y]
              next
            end
            g1.cells << [x, y]
            g2.cells.reject { |c| g1.cells.include?(c) }.each do |merge_cell|
              g1.cells << merge_cell
            end
            g2.cells = []
            pp [g1, g2] if verbose
            pp GROUPS.include?(g1) if verbose
            pp GROUPS if verbose
          else
            GROUPS.find { |g| g.cells.include?([x, y - 1]) }.cells << [x, y]
          end
        else
          if row[x - 1] == 1 && x != 0
            puts "searching for #{x},#{y}" if verbose
            g1 = GROUPS.find { |g| g.cells.include?([x - 1, y]) }
            g1.cells << [x, y]
          else
            GROUPS << Group.new([[x, y]])
          end
        end
      end
    end
  end
end
pp GROUPS.count { |g| g.cells.count > 0 }

__END__
jzgqcdpd
