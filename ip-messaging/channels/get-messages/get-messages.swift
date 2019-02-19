channel.messages.getLastMessagesWithCount(100, completion: { (result, messages) in
  for message in messages {
    print("Message body: \(message.body)")
  }
})