// To disconnect from a room, we call:
[self.room disconnect];

// This results in a callback to TVIRoomDelegate#room:didDisconnectWithError

#pragma mark - TVIRoomDelegate

- (void)room:(TVIRoom *)room didDisconnectWithError:(NSError *)error {
    NSLog(@"Did disconnect from room");
}
