class RoomsController < ApplicationController

  before_action :authenticate_user!


  def index
    @rooms = Room.all
    @room_messages = RoomMessage.all
  end

  def show
    @pub = Pub.find(params[:pub_id])
    @room = Room.find(params[:id])
    @room_message = RoomMessage.new room: @room
    @room_messages = @room.room_messages.includes(:user)

  end

  def new
    @room = Room.new
    @pub = Pub.find(params[:pub_id].to_i)
  end

  def create
    @room = Room.new permitted_parameters
    # @room.pub = params[:pub_id]
    @pub = Pub.find(params[:pub_id].to_i)
    @room.pub = @pub
    if @room.save
      flash[:success] = "Room #{@room.name} was created successfully"
      redirect_to pub_path(@pub)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update_attributes(permitted_parameters)
      flash[:success] = "Room #{@room.name} was updated successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  private

  def load_entities
    @room = Room.find(pub_id: params[:pub_id])
  end

  def permitted_parameters
    params.require(:room).permit(:name)
  end
end
