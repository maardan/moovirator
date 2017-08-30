class MovieController < ApplicationController
	before_action :initialize_process

	def index
		@top_movies = Movie.current_top_movies
	end

  def sort 
  	@top_movies = Movie.sort_movies(params[:id].to_i)
  	render :show, locals: { id: params[:id] }
  end

  private
    def initialize_process
			@genre_decoder = Movie.genre_decoder
			@avg_review_hash = Hash[Movie.pluck(:movie_id, :avg_rating)] # get a quick hash map of {movie_id: avg_rating} to quickly populate fields
    end
end