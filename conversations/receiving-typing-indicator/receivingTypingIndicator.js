conversation.on("typingStarted", (participant) => {
    // receives a Participant object for a participant who started typing
});

conversation.on("typingEnded", (participant) => {
    // receives a Participant object for a participant who finished typing
});
