def play arg
  board = parse_board arg
  row, column = choose_move board
  x = %w{A B C D E F G H I}[column]
  y = row + 1
  puts "#{x}#{y}"
end

def choose_move board
  row = board.find_index {|row| row.include?("-") }
  column = board[row].find_index "-"
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
