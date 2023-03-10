class RoomMessagesController < ApplicationController
  before_action :load_entities

  # def create
  #   @room_message = RoomMessage.create(user: current_user, room: @room, message: params.dig(:room_message, :message))

  #   if @room_message.save!
  #     redirect_to room_path(@room)
  #   else
  #     render "rooms/show", status: :unprocessable_entity
  #   end
  # end
  def create
    @room_message = RoomMessage.create user: current_user,
                                       room: @room,
                                       message: params.dig(:room_message, :message)

    # RoomChannel.broadcast_to @room, @room_message

    if @room_message.save!
      redirect_to room_path(@room)
    else
      render "rooms/show", status: :unprocessable_entity
    end
  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end
end
