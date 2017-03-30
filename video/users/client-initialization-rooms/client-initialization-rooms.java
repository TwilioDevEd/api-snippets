// Connect to a room
ConnectOptions connectOptions = new ConnectOptions.Builder(accessToken)
                .roomName("my-room")
                .localMedia(localMedia)
                .build();
Room room = Video.connect(context, connectOptions, roomListener());
