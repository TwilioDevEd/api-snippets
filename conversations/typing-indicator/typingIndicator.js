/* Typing indicator */

// the user is typing
messageInput.on("change", async () => {
    await conversation.typing();
});

conversation.on("typingStarted", (participant) => {
    // getting a participant that started typing
});

conversation.on("typingEnded", (participant) => {
    // getting a participant that finished typing
});
