class MoviesCharactersController < ApplicationController

	def index
		@movie = Movie.find(params[:movie_id])
		render json: @movie.characters
	end

	def create
		@movie = Movie.find(params[:movie_id])
		@character = Character.find(params[:character_id])
		if @movie.characters << @character
	    	render json: @movie.to_json(:include => [:characters]), status: :created, location: @movie
	    else
	    	render json: @movie.character.errors, status: :unprocessable_entity
	    end
	end 

	def destroy
		@movie = Movie.find(params[:movie_id])
		@character = Character.find(params[:id])
  		@character.movies.delete(@movie)
	end

end
