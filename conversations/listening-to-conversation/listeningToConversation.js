/* Listening to Conversation state change (inactive/closed) */

client.on("conversationUpdated", ({conversation, updateReasons}) => {
    if (!updateReasons.includes("state")) {
        // conversation state was not updated
        return;
    }

    if (conversation.state.current === "inactive") {
        // handle inactive conversation
    }

    if (conversation.state.current === "closed") {
        // handle closed conversation
    }
});

client.on("conversationAdded", (conversation) => {
    // event triggers when new conversation was created or a conversation becomes visible to the client
});
