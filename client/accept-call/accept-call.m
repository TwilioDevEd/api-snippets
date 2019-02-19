- (void)device:(TCDevice *)device didReceiveIncomingConnection:(TCConnection *)connection
{
    if (device.state == TCDeviceStateBusy) {
        [connection reject];
    } else {
        _connection = [connection accept];
    }
}