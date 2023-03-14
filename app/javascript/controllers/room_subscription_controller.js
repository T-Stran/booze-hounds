import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="room-subscription"
export default class extends Controller {
  static values = { roomId: Number }
  static targets = ["room_messages"]




  connect() {
    console.log(`Subscribe to the room with the id ${this.chatroomIdValue}.`)
  }
}


connect() {
  this.channel = createConsumer().subscriptions.create(
    { channel: "RoomChannel", id: this.roomIdValue },
    { received: data => console.log(data) }
  )
  console.log(`Subscribed to the room with the id ${this.roomIdValue}.`)
}
