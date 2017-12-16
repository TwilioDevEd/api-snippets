// function called after client init to set up event handlers
function registerEventHandlers() {
  // Register UserInfo specific event handler
  ipMessagingClient.on('userInfoUpdated', handleUserUpdate(user));
}

// function to handle any UserInfo updates
function handleUserUpdate(user) {
  // handle reachability indicator
  if (ipMessagingClient.reachabilityEnabled) {
    // call a function which will update the relevant UI elements to show the Reachability state for the User
    renderUserReachability(user.online, user.notifiable);
  }
}
