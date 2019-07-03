class ResultGames
  attr_accessor :ccc, :argum
  def initialize(argum)
    @argum = argum
    p @ccc = []
  end
  def counted_points
    p @ccc << @argum
  end
end