// Where "channel" is a TMChannel
let message: TWMMessage = channel.messages.createMessageWithBody("test")
channel.messages.sendMessage(message) { result in
    if result.isSuccessful() {
        print("Message sent.")
    } else {
        print("Message NOT sent.")
    }
}
