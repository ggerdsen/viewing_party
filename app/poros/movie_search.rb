class MovieSearch
  attr_reader :title, :vote_average, :id, :genres, :runtime, :overview

  def initialize(info)
    @title = info[:title]
    @vote_average = info[:vote_average]
    @id = info[:id]
    @overview = info[:overview]
    @runtime = info[:runtime]
    @genres = info[:genres]
  end
end
