// Fetch the initial messages
[self.channel.messages getLastMessagesWithCount:BATCH_SIZE
                                     completion:^(TCHResult *result, NSArray<TCHMessage *> *messages) {
                                        self.messages = messages;
                                        // << consume the initial items in your UI >>
                                      }];

// ... user scrolls through messages list

// Fetch next set of messages when you get close to the
// end of your local messages
[self.channel.messages getMessagesBefore:([firstMessage.index integerValue] - 1)
                               withCount:BATCH_SIZE
                              completion:^(TCHResult *result, NSArray<TCHMessage *> *messages) {
                                NSIndexSet *indexes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, messages.count)];
                                [self.messages insertObjects:messages
                                                   atIndexes:indexes];
                                 // << consume the latest items in your UI >>
                              }];