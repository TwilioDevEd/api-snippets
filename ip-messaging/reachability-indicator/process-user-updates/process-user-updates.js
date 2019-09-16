// function called after client init to set up event handlers
function registerEventHandlers() {
  user = chatClient.user;
  // Register User updated event handler
  user.on('updated', event => handleUserUpdate(event.user, event.updateReasons));
}

// function to handle User updates
function handleUserUpdate(user, updateReasons) {
  // loop over each reason and check for reachability change
  updateReasons.forEach(reason =>
    if (reason == 'online') {
      //do something
    }
  )
}
