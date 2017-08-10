// intercept the keydown event
inputBox.on('keydown', function(e) {
  // if the RETURN/ENTER key is pressed, send the message
  if (e.keyCode === 13) {
    sendButton.click();
  } else {
    // else send the Typing Indicator signal
    activeChannel.typing();
  }
});
