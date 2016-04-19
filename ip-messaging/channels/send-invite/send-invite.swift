channel.members.inviteByIdentity("alice") { inviteResult in
  if inviteResult == .Success {
    print("user invited")
  }
}