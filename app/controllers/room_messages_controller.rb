class RoomMessagesController < ApplicationController
  before_action :load_entities

  def create
    @room_message = RoomMessage.new(
      user: current_user,
      room: @room,
      message: params.dig(:room_message, :message)
    )

    if @room_message.save!
      RoomChannel.broadcast_to @room, render_to_string(partial: "room_messages/room_message", locals: {room_message: @room_message})
      head :ok
    else
      render "rooms/show", status: :unprocessable_entity
    end
  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end
end
