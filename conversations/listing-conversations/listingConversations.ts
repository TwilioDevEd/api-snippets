import { Conversation, Paginator } from "@twilio/conversations";

// get the conversations paginator
let conversationsPaginator: Paginator<Conversation> = await client.getSubscribedConversations();

// get conversations
const conversations: Conversation[] = conversationsPaginator.items;
