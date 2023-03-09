class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.all
  end

  def new
    @pub = Pub.find(params[:pub_id])
    @favourite = Favourite.new
  end

  def create
    @pub = Pub.find(params[:pub_id])
    @favourite = Favourite.new(favourite_params)
    @favourite.pub = @pub
    @favourite.user = current_user
    if @favourite.save
      redirect_to favourite_path(@favourite)
    else
      redirect_to pub_path(@pub)
    end
  end

  private

  def favourite_params
    params.require(:favourite).permit(:pub_id)
  end

end
