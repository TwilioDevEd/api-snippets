let allMessages = channel.messages.allObjects()
for message in allMessages {
    print("Message body: \(message.body)")
}
