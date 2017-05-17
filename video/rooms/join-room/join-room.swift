@IBAction func joinRoom(sender: AnyObject) {
    let connectOptions = TVIConnectOptions.init(block: { (builder) in
        builder.roomName = "existing-room"
    })
    room = TwilioVideo.connect(with: connectOptions, delegate: self)

}

// MARK: TVIRoomDelegate

func didConnectToRoom(room: TVIRoom) {
    print("Did connect to room")
}
