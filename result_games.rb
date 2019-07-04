# frozen_string_literal: true

# Create class ResultGames
class ResultGames
  @@arr_points = []

  def self.counted_points(argum)
    @@arr_points << argum
  end

  def self.sorting_result
    ooo = @@arr_points.inject { |memo, el| memo.merge(el) { |_k, old_v, new_v| old_v + new_v } }
    ppp = ooo.sort
    lll = ppp.sort { |a, b| b[1] <=> a[1] }
    lll.each { |key, value| puts "#{key}, #{value}" }
  end
end
