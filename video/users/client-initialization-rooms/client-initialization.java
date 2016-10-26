// Create a Video Client and connect to Twilio's backend.
VideoClient videoClient = new VideoClient(VideoActivity.this, accessToken);

// Connect to a room
ConnectOptions connectOptions = new ConnectOptions.Builder()
                .roomName("my-room")
                .localMedia(localMedia)
                .build();
Room room = videoClient.connect(connectOptions, roomListener());
