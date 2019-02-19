// Where "channel" is a TCHChannel
if let messages = channel.messages {
  let options = TCHMessageOptions().withBody("test")
  messages.sendMessage(with: options) { result, message in
    if result.isSuccessful() {
      print("Message sent.")
    } else {
      print("Message NOT sent.")
    }
  }
}

