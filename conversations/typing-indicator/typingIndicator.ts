/* Typing indicator */
import {Participant} from "@twilio/conversations";

// the user is typing
messageInput.on("change", async () => {
    await conversation.typing();
});

conversation.on("typingStarted", (participant: Participant) => {
    // getting a participant that started typing
});

conversation.on("typingEnded", (participant: Participant) => {
    // getting a participant that finished typing
});
