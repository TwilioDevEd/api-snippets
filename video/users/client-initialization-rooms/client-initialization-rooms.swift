let connectOptions = TVIConnectOptions.init(token: accessToken) { (builder) in
    builder.roomName = "my-room"
}

room = TwilioVideo.connect(with: connectOptions, delegate: self)