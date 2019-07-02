# if $stdin.tty?
#   ARGV.each do |file|
#     puts "do something with this file: #{file}"
#   end
# else
#   $stdin.each_line do |line|
#     puts "do something with this line: #{line}"
#   end
# end

#
#
# while STDIN.gets
#   puts $_
# end
#
# while ARGF.gets
#   puts $_
# end
#
#
# all_lines = ""
# ARGV.each do |line|
#   all_lines << line + "\n"
# end
# puts all_lines
#
#
#
# File.open(ARGV[0], 'w') do |file|
#   ARGV.clear
#
#   ARGF.each do |line|
#     puts line
#     file.write(line)
#   end
# end
#
#
# STDIN.gets.chomp == 'YES'
#
#
# while a=(ARGV.shift or (!STDIN.tty? and STDIN.gets) )
#   puts a
# end
#
#
if ARGV.length != 1
  puts "We need exactly one parameter. The name of a file."
  exit;
end

filename = ARGV[0]
puts "Going to open '#{filename}'"

fh = open filename

fh.each do |line|
  p line
end

fh.close





File.open("names.txt") do |f|
  f.each do |readl|
    name, last_name, year = readl.chomp.split(";")
    puts "First name: #{name}, last name #{last_name}, year #{year}"
  end
end
