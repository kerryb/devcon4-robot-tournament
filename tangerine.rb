def play arg
  $board = parse_board arg
  row, column = choose_move
  x = %w{A B C D E F G H I}[column]
  y = row + 1
  puts "#{x}#{y}"
end

def choose_move
  find_half_killed_ships or random_fire
end

def find_half_killed_ships
end

def random_fire
  find_char "-"
end

def find_char char
  row = $board.find_index {|row| row.include?(char) } or return nil
  column = $board[row].find_index(char) or return nil
  [row, column]
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
