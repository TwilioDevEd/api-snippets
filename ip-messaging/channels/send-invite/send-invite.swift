channel.members.inviteByIdentity("Juan") { result in
    if result.isSuccessful() {
        print("User invited.")
    } else {
        print("User NOT invited.")
    }
}
