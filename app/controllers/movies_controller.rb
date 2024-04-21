class MoviesController < ApplicationController
  def update
    m_id = params.fetch("the_id")
    matching_records = Movie.where({ :id => m_id})
    the_movie = matching_records.at(0)
    the_movie.title = params.fetch("title")
    the_movie.year = params.fetch("year")
    the_movie.duration = params.fetch("duration")
    the_movie.description = params.fetch("desc")
    the_movie.image = params.fetch("image")
    the_movie.director_id = params.fetch("director")
    the_movie.save
    redirect_to("/movies/#{the_movie.id}")
  end  
  
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    m = Movie.new
    m.title = params.fetch("title")
    m.year = params.fetch("year")
    m.duration = params.fetch("duration")
    m.description = params.fetch("desc")
    m.image = params.fetch("image")
    m.director_id = params.fetch("director")

    m.save

    redirect_to("/movies")
  end

  def destroy
    the_id = params.fetch("an_id")
    matching_records = Movie.where({ :id => the_id})
    the_movie = matching_records.at(0)
    the_movie.destroy
    redirect_to("/movies")
  end


end
