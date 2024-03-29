class PubsController < ApplicationController

  def index

    # @pub = Pub.new
    # @pubs = Pub.all
    if params[:search].present?
      Query.create(title: params[:search])
      @search = Geocoder.search(params[:search]).first
      @pubs = Pub.near([@search.coordinates[0], @search.coordinates[1]], 0.5)
      # if list_condition
      #   @pubs = Pub.near([@search.coordinates[0], @search.coordinates[1]], 0.5)
      #   selected_filters = params.keys.select { |key| params[key] == "1" }
      #   selected_filters.each { |f| @pubs = @pubs.where(f => true) && Pub.near([@search.coordinates[0], @search.coordinates[1]], 0.5) }
      # end
    elsif params[:query].present?
      @pubs = Pub.where("name ILIKE ?", "%#{params[:query]}%")
      # elsif list_condition
      # selected_filters = params.keys.select { |key| params[key] == "1" }
      # selected_filters.each { |f| @pubs = @pubs.where(f == true && "name ILIKE ?", "%#{params[:query]}%") }

    elsif list_condition
      # THIS IS TO MAKE THE FILTERS APPLY ONLY AROUND THE GIVEN POSTCODE
      @query = Query.last.title
      @search = Geocoder.search(@query).first
      @pubs = Pub.near([@search.coordinates[0], @search.coordinates[1]], 0.5)

      # @pubs = Pub.all
      selected_filters = params.keys.select { |key| params[key] == "1" }
      selected_filters.each { |f| @pubs = @pubs.where(f => true) }
      # @pubs = Pub.where("name ILIKE ?", "%#{query_string}%")
    else
      @pubs = Pub.all
    end

    # if params[:garden].present?
    #   @pubs = @pubs.where(garden: true)
    # end

    # if list_condition
    #   if params[:search].present?
    #     search = Geocoder.search(params[:search]).first
    #     @pubs = Pub.near([search.coordinates[0], search.coordinates[1]], 0.5)
    #     selected_filters = params.keys.select { |key| params[key] == "1" }
    #     selected_filters.each { |f| @pubs = @pubs.where(f => true && Pub.near([search.coordinates[0], search.coordinates[1]], 0.5)) }
    #   end
    #   raise
    # end


    @markers = @pubs.geocoded.map do |pub|
      {
        lat: pub.latitude,
        lng: pub.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {pub: pub})
      }
    end


    # @markers = @pubs.geocoded.map do |pub|
    #   {
    #     lat: pub.latitude,
    #     lng: pub.longitude,
    #     info_window_html: render_to_string(partial: "info_window", locals: {pub: pub})
    #   }
    # end
  end


  # def myindex (if needed for my favourite pubs)
  #   @pubs = Pub.where(user_id: current_user.id)
  # end

  def show
    @pub = Pub.find(params[:id])
    @review = Review.new
    @local = Local.new
    @dog = Dog.new
    @favourite = Favourite.new
    @room = Room.new
  end

  def new
    @pub = Pub.new(params[:id])
  end

  def random
    @minimum = Pub.all.first.id
    @max = Pub.all.last.id
    @random = rand(@minimum..@max)
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

  def list_condition
    params.keys.include?("garden") || params.keys.include?("parking") || params.keys.include?("live_sport") || params.keys.include?("wheelchair_accessible") || params.keys.include?("food_menu")
  end

  def pub_params
    params.require(:pub).permit(:name, :address, :description, :opening_time, :closing_time, :website, :phone_number,
                                :pool_table, :non_alcoholic_drinks_selection, :garden, :parking, :live_sport,
                                :wheelchair_accessible, :food_menu)
  end
end
