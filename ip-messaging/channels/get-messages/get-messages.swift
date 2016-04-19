let allMessages = channel.messages.allObjects()
for message in allMessages {
  print("message body: \(message.body)")
}