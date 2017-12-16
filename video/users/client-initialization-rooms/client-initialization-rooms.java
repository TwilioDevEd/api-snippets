// Connect to a room
ConnectOptions connectOptions = new ConnectOptions.Builder(accessToken)
                .roomName("my-room")
                .audioTracks(localAudioTracks)
                .videoTracks(localVideoTracks)
                .build();
Room room = Video.connect(context, connectOptions, roomListener());
