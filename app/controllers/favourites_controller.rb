class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.where(user_id: current_user.id)
  end

  # def new
  #   @pub = Pub.find(params[:pub_id])
  #   @favourite = Favourite.new
  # end

  def create
    @favourite = Favourite.new
    @favourite.user = current_user
    @pub = Pub.find(params[:pub_id])
    @favourite.pub = @pub
    if @favourite.save
      redirect_to pub_path(@pub), notice: "The pub was sucesfully added to favourites"
    end
  end

  # def add_favourite
  #   raise
  #   @pub = Pub.find(params[:id])
  #   @favourite = Favourite.new
  #   @favourite.user = current_user
  #   @favourite.pub_id = @pub.id

  #   if @favourite.save!
  #     redirect_to pub_path(@pub), notice: "The pub was sucesfully added to favourites"
  #   end
  # end

  def destroy
    @favourite = Favourite.find(params[:id])
    if @favourite.destroy!
      redirect_to user_favourites_path(:user_id), status: :see_other
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def favourite_params
    params.require(:favourite).permit(:pub_id)
  end

end
