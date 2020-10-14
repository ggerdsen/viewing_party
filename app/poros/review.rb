class Review
  attr_reader :info

  def initialize(data)
    @info = data[:results]
  end
end
