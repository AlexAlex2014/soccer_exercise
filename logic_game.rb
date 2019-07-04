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

  def arg_m(argums)
    argums.first[1] = 3
    argums.last[1] = 0
  end

  def arg_l(argums)
    argums.first[1] = 0
    argums.last[1] = 3
  end

  def arg_eq(argums)
    argums.first[1] = 1
    argums.last[1] = 1
  end

  def comparison_results(argums)
    if argums.first[1] > argums.last[1]
      arg_m(argums)
    elsif argums.first[1] < argums.last[1]
      arg_l(argums)
    else
      arg_eq(argums)
    end
    qqq(argums)
  end

  def qqq(arg)
    arg.each do |i|
      @arr << Hash[*i]
    end
  end
end
