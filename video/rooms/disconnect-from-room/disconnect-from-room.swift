// To disconnect from a Room, we call:
room.disconnect()

// This results in a callback to TVIRoomDelegate#room:didDisconnectWithError

// MARK: TVIRoomDelegate

func room(_ room: TVIRoom, didDisconnectWithError error: Error?) {
    print("Disconnected from room \(room.name)")
}
