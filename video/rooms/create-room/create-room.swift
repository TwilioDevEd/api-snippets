@IBAction func createARoom(sender: AnyObject) {
    let connectOptions = TVIConnectOptions.init(token: accessToken) { (builder) in
        builder.roomName = "my-room"
    }
    room = TwilioVideo.connect(with: connectOptions, delegate: self)
}

// MARK: TVIRoomDelegate

func didConnectToRoom(room: TVIRoom) {
    print("Did connect to Room")
}
