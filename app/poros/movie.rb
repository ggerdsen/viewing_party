class Movie
  attr_reader :title, :vote_average, :id, :genres, :runtime, :overview

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @id = data[:id]
    @overview = data[:overview]
    @runtime = data[:runtime]
    @genres = data[:genres]
  end

  def genres_list
    @genres.map { |genre| genre[:name] }
  end

  def to_hours_minutes
    hours = @runtime / 60
    rest = @runtime % 60
    "#{hours}hr #{rest} min"
  end
end
