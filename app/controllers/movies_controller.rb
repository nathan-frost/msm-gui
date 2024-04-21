class MoviesController < ApplicationController
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


end
