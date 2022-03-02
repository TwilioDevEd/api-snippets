/* Using Attributes */

// add attributes to a message
const message = await conversation.prepareMessage().setBody("message text");

await conversation.setAttributes("attribute");
await conversation.setAttributes(2);
await conversation.setAttributes(true);
await conversation.setAttributes({attributeKey: "attributeValue"});
await conversation.setAttributes(["attribute", "anotherAttribute"]);

// get the attributes
const messageAttributes = message.attributes;

// add participant to the conversation with attributes
await conversation.add("identity", "attribute");
await conversation.add("identity", 2);
await conversation.add("identity", true);
await conversation.add("identity", {attributeKey: "attributeValue"});
await conversation.add("identity", ["attribute", "anotherAttribute"]);

// get the attributes
const participant = await conversation.getParticipantByIdentity("identity");
const participantAttributes = participant.attributes;
