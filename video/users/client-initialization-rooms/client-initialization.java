// Create a Video Client and connect to Twilio's backend.
AccessManager accessManager = new AccessManager(VideoActivity.this,
                token,
                accessManagerListener());
VideoClient videoClient = new VideoClient(VideoActivity.this, accessManager);

// Connect to a room
ConnectOptions connectOptions = new ConnectOptions.Builder()
                .roomName("my-room")
                .localMedia(localMedia)
                .build();
Room room = videoClient.connect(connectOptions, roomListener());