class MoviesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    movies = Movie.all
    render json: movies
    # attributes returned such as title, year etc are controlled by movie_serializer

  end

  def show
    movie = Movie.find(params[:id])
    render json: movie
    # attributes returned such as title, year etc are controlled by movie_serializer
  end

  def summary
    movie = Movie.find(params[:id])

    #use serializer to tell rails to summaries movie Instance
    render json: movie, serializer: MovieSummarySerializerSerializer
  end


  def summaries
    movies = Movie.all

    #use each_serializer to tell rails to summary each Movie Instance
    render json: movies, each_serializer: AllMovieSummariesSerializerSerializer
  end

  private

  def render_not_found_response
    render json: { error: "Movie not found" }, status: :not_found
  end
end
