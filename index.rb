# frozen_string_literal: true

require_relative 'logic_game'
require_relative 'result_games'

result = []

if ARGV.length != 1
  puts 'We need exactly one parameter. The name of a file.'
  exit
end

filename = ARGV[0]
puts "Going to open '#{filename}'"
fh = open filename

LogicGame.new(fh).read_line

fh.close

ResultGames.sorting_result
