channel.destroyWithCompletion { result in
  if result == .Success {
    print("channel destroyed")
  }
}