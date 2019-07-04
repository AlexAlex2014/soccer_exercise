# frozen_string_literal: true

# Create logic game
class LogicGame
  include ResultGames
  attr_reader :arr_result
  def initialize(arr_result)
    @arr_result = arr_result
    @arr = []
  end

  def run
    read_line
    sorting_result
  end

  def read_line
    @arr_result.each do |line|
      arr_line = line.chomp.split(', ')
      conversion_array(arr_line)
    end
  end

  def conversion_array(arr_line)
    array_values = []

    arr_line.each do |readl|
      arr_new = readl.chomp.split(' ')
      array_values << arr_new
    end
    comparison_results(array_values)
  end

  def comparison_results(argums)
    if argums.first[1] > argums.last[1]
      argums.first[1] = 3
      argums.last[1] = 0
    elsif argums.first[1] < argums.last[1]
      argums.first[1] = 0
      argums.last[1] = 3
    else
      argums.first[1] = 1
      argums.last[1] = 1
    end
    qqq(argums)
  end

  def qqq(arg)
    arg.each do |i|
      @arr << Hash[*i]
    end
  end
end
