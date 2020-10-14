class Cast
  attr_reader :info

  def initialize(data)
    @info = data[:cast]
  end
end
