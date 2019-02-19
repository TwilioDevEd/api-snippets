// Fetch the initial messages
channel.messages.getLastWithCount(BATCH_SIZE) { (result, messages) in
  self.messages = messages!
  // << consume the initial items in your UI >>
}

// ... user scrolls through messages list

// Fetch next set of messages when you get close to the
// end of your local messages
channel.messages.getBefore(UInt(self.messages.first!.index) - 1, withCount: BATCH_SIZE) { (result, messages) in
  self.messages.append(contentsOf: messages!)
  // << consume the latest items in your UI >>
}
