import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="room-subscription"
export default class extends Controller {
  static values = { roomId: Number }
  static targets = ["messages"]

  connect() {
    console.log("roomIdValue", this.roomIdValue)
    console.log("room messages target", this.messagesTarget)
    this.channel = createConsumer().subscriptions.create(
      { channel: "RoomChannel", id: this.roomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribed to the room with the id ${this.roomIdValue}.`)
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    console.log(this.messagesTarget.scrollHeight)

    this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight
  }

  resetForm(event) {
    console.log("resetting form")
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
