// Create a Video Client and connect to Twilio's backend.
var client = TVIVideoClient(token: accessToken)

// Connect to a room
let connectOptions = TVIConnectOptions { (builder) in
    builder.name = "my-room"
}

if let client = client {
    room = client.connect(with: connectOptions, delegate: self)
}