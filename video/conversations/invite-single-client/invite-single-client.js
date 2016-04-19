client.inviteToConversation('alice').then(function(conversation) {
    console.log("Successfully joined Conversation: "  conversation.sid);
}, function(error) {
    console.error("Unable to join Conversation : "  error.message);
});
