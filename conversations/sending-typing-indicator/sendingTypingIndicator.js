//the SDK user is typing
//you can call this any time the input field changes - the SDK optimizes how often the signal actually gets transmitted
messageInput.on("change", async () => {
    await conversation.typing();
});

