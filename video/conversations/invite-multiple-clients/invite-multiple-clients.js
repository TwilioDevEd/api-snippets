client.createConversation(['alice', 'bob']).then(function(conversation) {
    console.log("connected to conversation: "  conversation.sid);
}, function(error) {
    console.error("Unable to connect to Conversation : "  error.message);
});