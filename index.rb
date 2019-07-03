require_relative 'logic_game'
require_relative 'result_liga'

result = []

if ARGV.length != 1
  puts "We need exactly one parameter. The name of a file."
  exit;
end

filename = ARGV[0]
puts "Going to open '#{filename}'"
fh = open filename

fh.each do |line|
  arr_line = line.chomp.split(", ")
  v = LogicGame.new(arr_line).conversion_array
  result << v
end


# p v.LogicGame.zzz
fh.close

p sum_points = result.flatten
 p Hash[*sum_points]


