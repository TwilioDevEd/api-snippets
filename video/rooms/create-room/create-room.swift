@IBAction func createARoom(sender: AnyObject) {
    let connectOptions = TVIConnectOptions.init(block: { (builder) in
        builder.name = "my-room"
    })
    room = videoClient.connectWithOptions(connectOptions, delegate: self)
}

// MARK: TVIRoomDelegate
func didConnectToRoom(room: TVIRoom) {
    print("Did connect to room")
}
