channel.destroyWithCompletion { result in
    if result.isSuccessful() {
        print("Channel destroyed.")
    } else {
        print("Channel NOT destroyed.")
    }
}
