/* Adding Participants (chat and non-chat) */
import {Participant} from "@twilio/conversations";

// add chat participant to the conversation by its identity
await conversation.add("identity");

// add a non-chat participant to the conversation
const proxyAddress: string = "+11222333";
const address: string = "+12345678";
await conversation.addNonChatParticipant(proxyAddress, address);

// adds yourself as a conversations sdk user to this conversation
// use after creating the conversation from the SDK
await conversation.join();

conversation.on("participantJoined", (participant: Participant) => {
    // fired when a participant has joined the conversation
});
