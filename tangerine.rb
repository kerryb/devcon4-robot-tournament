case ARGV[0]
when "START"
  puts
else
  x = %w{A B C D E F G H I}[rand 9]
  y = rand(9) + 1
  puts "#{x}#{y}"
end
