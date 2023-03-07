class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @pub = Pub.find(params[:pub_id])
    @review = Review.new
  end

  def create
    @pub = Pub.find(params[:pub_id])
    @review = Review.new(review_params)
    if @review.save
      redirect_to pubs_path(@pub)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :pub_id, :user_id)
  end
end
