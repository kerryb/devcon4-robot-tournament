require "pp"

def play arg
  $board = parse_board arg
  column, row = choose_move
  x = %w{A B C D E F G H I}[column]
  y = row + 1
  puts "#{x}#{y}"
end

def choose_move
  find_half_killed_ships or random_fire
end

def find_half_killed_ships
  hits = find_chars("X") or return nil
  hits.each do |hit|
    [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |dx, dy|
      neighbour_coords = [hit[0] + dx, hit[1] + dy]
      neighbour = content_of neighbour_coords
      return neighbour_coords if neighbour == "-"
    end
  end
  nil
end

def content_of coords
  return nil if coords.any? {|c| c < 0 || c > 8 }
  $board[coords[1]][coords[0]]
end

def random_fire
  blanks = find_chars("-")
  blanks[rand(blanks.size)]
end

def find_chars char
  positions = []
  $board.each_with_index do |row, y|
    row.each_with_index do |content, x|
      positions << [x, y] if content == char
    end
  end
  positions.empty? ? nil : positions
end

def parse_board str
  str.chars.each_slice(9).to_a
end

arg = ARGV[0]
case arg
when "START"
  puts
else
  play arg
end
