/* Updating Conversations/Messages/Participants */

/* Conversations */

await conversation.updateAttributes({});
await conversation.updateFriendlyName("foo");
await conversation.updateLastReadMessageIndex(0);
await conversation.updateUniqueName("foo");

/* Messages */

await message.updateAttributes([1, {foo: "bar"}]);
await message.updateBody("bar");

/* Participants */

await participant.updateAttributes({foo: 8});
