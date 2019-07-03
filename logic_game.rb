class LogicGame
  attr_reader :arr_result
  def initialize(arr_result)
    @arr_result = arr_result
  end

  def conversion_array
    array_values = []

    @arr_result.each do|readl|
      arr_new = readl.chomp.split(" ")
      array_values << arr_new.first.to_sym
      array_values << arr_new.last.to_i

    end
    create_hash(array_values)
  end

  def create_hash(arr_convert)
    create_hash = Hash[*arr_convert]
    comparison_results(create_hash)
  end

  def comparison_results(argums)
    q = argums.to_a
    if q.first[1] == q.last[1]
      q.first[1] = 1
      q.last[1] = 1
    end
    if q.first[1] > q.last[1]
      q.first[1] = 3
      q.last[1] = 0
    end
    if q.first[1] < q.last[1]
      q.first[1] = 0
      q.last[1] = 3
    end
    q.each do |i|
      Hash[*i]
    end
  end
end
