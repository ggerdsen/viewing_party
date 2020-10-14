class Movie
  attr_reader :title, :vote_average, :id, :genres, :runtime, :overview, :genres_list

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @id = data[:id]
    @overview = data[:overview]
    @runtime = data[:runtime]
    @genres = data[:genres]
  end
  
  def genres_list
    x = @genres.map {|genre| genre[:name]}
  end
  
  def to_hours_minutes
    hours = @runtime / 60
    rest = @runtime % 60
    x = "#{hours}hr #{rest} min"
  end
end
