/* Get Conversation by SID/Unique Name */

// by SID
const conversation = await client.getConversationBySid("bar");

// by Unique Name
const conversation = await client.getConversationByUniqueName("foo");
