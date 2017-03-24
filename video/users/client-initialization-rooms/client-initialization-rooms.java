// Connect to a room
ConnectOptions connectOptions = new ConnectOptions.Builder(accessToken)
                .roomName("my-room")
                .localMedia(localMedia)
                .build();
Room room = VideoClient.connect(context, connectOptions, roomListener());
