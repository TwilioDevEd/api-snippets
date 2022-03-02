// get the conversations paginator
let conversationsPaginator = await client.getSubscribedConversations();

// get conversations
const conversations = conversationsPaginator.items;
