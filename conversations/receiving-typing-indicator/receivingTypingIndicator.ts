conversation.on("typingStarted", (participant: Participant) => {
    // receives a Participant object for a participant who started typing
});

conversation.on("typingEnded", (participant: Participant) => {
    // receives a Participant object for a participant who finished typing
});
