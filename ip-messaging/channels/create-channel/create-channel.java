 mChatClient.getChannels().createChannel("general",
  Channel.ChannelType.PUBLIC, new CallbackListener<Channel>() {
      @Override
      public void onSuccess(Channel channel) {
          if (channel != null) {
              Log.d(TAG,"Success creating channel");
          }
      }

      @Override
      public void onError(ErrorInfo errorInfo) {
          Log.e(TAG,"Error creating channel: " + errorInfo.getErrorText());
      }
  });