/* Get Conversation by SID/Unique Name */
import {Conversation} from "@twilio/conversations";

// by SID
const conversation: Conversation = await client.getConversationBySid("bar");

// by Unique Name
const conversation: Conversation = await client.getConversationByUniqueName("foo");
