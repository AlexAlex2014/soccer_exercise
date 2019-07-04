# frozen_string_literal: true

# Create module ResultGames
module ResultGames
  def sorting_result
    counting_points = @arr.inject do |memo, el|
      memo.merge(el) { |_k, old_v, new_v| old_v + new_v }
    end
    sorting_a = counting_points.sort
    sorting_rating = sorting_a.sort { |a, b| b[1] <=> a[1] }
    sorting_rating.each { |key, value| puts "#{key}, #{value} pts" }
  end
end
