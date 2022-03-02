/* event handler examples */

client.on("conversationUpdated", ({conversation, updateReasons}) => {
    // Fired when the attributes or the metadata of a conversation have been updated
});

conversation.on("messageUpdated", ({message, updateReasons}) => {
    // Fired when data of a message has been updated.
});

participant.on("updated", ({participant, updateReasons}) => {
    // Fired when the fields of the participant have been updated.
});
