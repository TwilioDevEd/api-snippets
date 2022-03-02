/* get the latest messages of the conversation. optional arguments:
  pageSize | 30,
  anchor | "end",
  direction | "backwards"
 */

// get the messages paginator the latest 30 messages
let messagesPaginator = await conversation.getMessages(30, 0, "backwards");

// get messages
const messages = messagesPaginator.items;
