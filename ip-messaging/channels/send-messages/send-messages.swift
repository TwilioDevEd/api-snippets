// Where "channel" is a TMChannel
let message: TMMessage = channel.messages.createMessageWithBody("test")
channel.messages.sendMessage(message) { result in
  if result == .Success {
      print("Message sent")
  }
}
