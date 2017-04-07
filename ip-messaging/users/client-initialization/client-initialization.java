ChatClient.Properties.Builder builder = new ChatClient.Properties.Builder();
builder.setSynchronizationStrategy(ChatClient.SynchronizationStrategy.ALL);
ChatClient.Properties props = builder.createProperties();
ChatClient.create(MainActivity.this,accessToken,props,mChatClientCallback);