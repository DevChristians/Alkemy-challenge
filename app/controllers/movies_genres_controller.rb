class MoviesGenresController < ApplicationController
	def index
		@movie = Movie.find(params[:movie_id])
		render json: @movie.genres
	end

	def create
		@movie = Movie.find(params[:movie_id])
		@genre = Genre.find(params[:genre_id])
		if @movie.genres << @genre
	    	render json: @movie.genres, status: :created, location: @movie
	    else
	    	render json: @movie.genre.errors, status: :unprocessable_entity
	    end
  	end 

  	def destroy
	    @movie = Movie.find(params[:movie_id])
	    @genre = Genre.find(params[:id])
	    @genre.movies.delete(@movie)
	end
end
