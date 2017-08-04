// Get messages from the newest to oldest
channel
  .getMessages(20 /* by pages of 20 messages */)
  .then(function(messagesPage) {
    messagesPage.items.forEach(function(message) {
      // do stuff for each message
    });
    // note, that by default pages are in "backwards" order,
    // so you should ask for previous page, not the next one
    if (messagesPage.hasPrevPage) {
      return messagesPage.prevPage(); // here we can ask for following page
    }
  });

// Get messages from the message with id 3 to newest
channel.getMessages(20, 3, 'forward').then(function(messagesPage) {
  /* handle page the same way as above */
});

// Handle multiple pages
// Unfortunately, js has no asynchronous iterators yet, so there should be
// some boilerplate here. One of the way to go through all messages would be
// like this:
function processPage(page) {
  page.items.forEach(function(message) {
    /* do something for message */
  });
  if (page.hasNextPage) {
    page.nextPage().then(processPage);
  } else {
    // all messages read!
  }
}
channel.getMessage(10, null, 'forward').then(processPage);
