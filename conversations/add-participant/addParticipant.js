/* Adding Participants (chat and non-chat) */

// add chat participant to the conversation by its identity
await conversation.add("identity");

// add a non-chat participant to the conversation
const proxyAddress = "+11222333";
const address = "+12345678";
await conversation.addNonChatParticipant(proxyAddress, address);

// adds yourself as a conversations sdk user to this conversation
// use after creating the conversation from the SDK
await conversation.join();

conversation.on("participantJoined", (participant) => {
    // fired when a participant has joined the conversation
});
