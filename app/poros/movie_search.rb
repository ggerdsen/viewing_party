class MovieSearch
  attr_reader :title, :vote_average, :id

  def initialize(info)
    @title = info[:title]
    @vote_average = info[:vote_average]
    @id = info[:id]
  end
end
