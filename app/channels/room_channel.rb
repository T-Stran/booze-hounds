class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find params[:room]
    # chatroom = Chatroom.find(params[:id])

    stream_for room

    # or
    # stream_from "room_#{params[:room]}"
  end
end
