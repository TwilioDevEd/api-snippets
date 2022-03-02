/* event handler examples */

import {
    Conversation,
    ConversationUpdateReason,
    Message,
    MessageUpdateReason,
    Participant,
    ParticipantUpdateReason
} from "@twilio/conversations";

client.on("conversationUpdated", ({conversation, updateReasons}: {
    conversation: Conversation,
    updateReasons: ConversationUpdateReason[]
}) => {
    // Fired when the attributes or the metadata of a conversation have been updated
});

message.on("updated", ({message, updateReasons}: {
    message: Message,
    updateReasons: MessageUpdateReason[]
}) => {
    // Fired when data of a message has been updated.
});

participant.on("updated", ({participant, updateReasons}: {
    participant: Participant,
    updateReasons: ParticipantUpdateReason[]
}) => {
    // Fired when the fields of the participant have been updated.
});
