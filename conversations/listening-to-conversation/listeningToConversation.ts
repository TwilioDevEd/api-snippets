/* Listening to Conversation state change (inactive/closed) */
import {Conversation, ConversationUpdateReason} from "@twilio/conversations";

client.on("conversationUpdated", ({conversation, updateReasons}: {
    conversation: Conversation,
    updateReasons: ConversationUpdateReason[]
}) => {
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

client.on("conversationAdded", (conversation: Conversation) => {
    // event triggers when new conversation was created or a conversation becomes visible to the client
});
