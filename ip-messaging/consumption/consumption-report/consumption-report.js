// determine the newest message index
const newestMessageIndex = activeChannel.messages.length
  ? activeChannel.messages[activeChannel.messages.length - 1].index
  : 0;
// check if we we need to set the consumption horizon
if (activeChannel.lastConsumedMessageIndex !== newestMessageIndex) {
  activeChannel.updateLastConsumedMessageIndex(newestMessageIndex);
}
