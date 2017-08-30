class ReviewsController < ApplicationController
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.order('movie_id DESC')
    @movies_with_reviews = Movie.order('movie_id DESC')
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    reviews_per_movie = Review.where('movie_id = ?', params[:id].to_i).order('created_at DESC')
    render layout: false, locals: { reviews_per_movie: reviews_per_movie, m_id: params[:id] }
  end

  # GET /reviews/new
  def new
    @review = Review.new
    render layout: false, locals: { curr_m_id: params[:m_id], curr_m_title: params[:m_title], curr_m_img: params[:m_img] }
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    if @review.save
      curr_movie_id = params[:review][:movie_id].to_i
      avg_review_hash = Hash[Movie.pluck(:movie_id, :avg_rating)]
      new_avg_rating = avg_review_hash[curr_movie_id].to_i
      render :success, status: :created, location: @review, locals: { m_id: curr_movie_id, rating: new_avg_rating }
    else
      flash.now[:alert] = 'Error while sending message!'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:movie_id, :movie_title, :movie_img, :rating, :comment, :email)
    end
end