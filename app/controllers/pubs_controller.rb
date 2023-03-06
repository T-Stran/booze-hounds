class PubsController < ApplicationController

  def index
    @markers = @pubs.geocoded.map do |pub|
      {
        lat: pub.latitude,
        lng: pub.longitude
      }
    end
  end

  end

  # def myindex (if needed for my favourite pubs)
  #   @pubs = Pub.where(user_id: current_user.id)
  # end

  def show
    @pub = Pub.find(params[:id])
  end

  def new
    @pub = Pub.new(params[:id])
  end

  def create
    @pub = Pub.new(pub_params)
    @pub.user = current_user
    if @pub.save
      redirect_to pub_path(@pub)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pub = Pub.find(params[:id])
  end

  def update
    @pub = Pub.find(params[:id])
    @pub.update(pub_params)
    redirect_to pubs_path(@pub)
  end

  def destroy
    @pub = Pub.ind(params[:id])
    @pub.destroy
    redirect_to pubs_path, status: :see_other
  end

  private

  def pub_params
    params.require(:pub).permit(:name, :description, :armaments, :capacity, :price, :speed, :photo) #TO BE UPDATED WITH CORRECT PARAMS
  end

end
