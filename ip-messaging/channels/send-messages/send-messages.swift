// Where "channel" is a TCHChannel
if let messages = channel.messages {
  let message = messages.createMessage(withBody: "test")
  messages.send(message) { result in
    if result.isSuccessful() {
      print("Message sent.")
    } else {
      print("Message NOT sent.")
    }
  }
}

