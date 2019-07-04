# frozen_string_literal: true

# Create logic game
class LogicGame
  attr_reader :arr_result
  def initialize(arr_result)
    @arr_result = arr_result
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
      array_values << arr_new.first
      array_values << arr_new.last.to_i
    end
    create_hash(array_values)
  end

  def create_hash(arr_convert)
    create_hash = Hash[*arr_convert]
    comparison_results(create_hash)
  end

  def comparison_results(argums)
    value = argums.to_a
    if value.first[1] > value.last[1]
      value.first[1] = 3
      value.last[1] = 0
    elsif value.first[1] < value.last[1]
      value.first[1] = 0
      value.last[1] = 3
    else
      value.first[1] = 1
      value.last[1] = 1
    end
    value.each do |i|
      ResultGames.counted_points(Hash[*i])
    end
  end
end
