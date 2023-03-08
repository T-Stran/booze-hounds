class PubsController < ApplicationController

  def index
    @pubs = Pub.all 


    @markers = @pubs.geocoded.map do |pub|
      {
        lat: pub.latitude,
        lng: pub.longitude
      }
    end
    if params[:query].present?
      @pubs = Pub.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @pubs = Pub.all
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
    @pub = Pub.find(params[:id])
    @pub.destroy
    redirect_to pubs_path, status: :see_other
  end

  private

  def pub_params
    params.require(:pub).permit(:name, :address, :description, :opening_time, :closing_time, :website, :phone_number,
                                :pool_table, :non_alcoholic_drinks_selection, :garden, :parking, :live_sport,
                                :wheelchair_accessible, :food_menu)
  end

end
