class ReviewsController < ApplicationController
  before_action :set_movie, only: %i[new create]

  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.movie_id = @movie.id
    @review.user_id = current_user.id
    @review.save
    redirect_to movie_path(@movie)
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
