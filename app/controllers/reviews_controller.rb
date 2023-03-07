class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @pub = Pub.find(params[:pub_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @pub = Pub.find(params[:pub_id])
    @review.pub = @pub
    if @review.save
      redirect_to pub_path(@pub)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
