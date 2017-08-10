channelDescriptor?.channel(completion:{ (result, channel) in
  if result!.isSuccessful() {
    print("Channel Status: \(String(describing: channel?.status))")
  }
})
