// If your subsequent pages will use the same completion
// handler, you can set the block as a variable to be
// referenced from within the block.
void __block (^_completion)();
TCHChannelDescriptorPaginatorCompletion completion = ^(TCHResult *result, TCHChannelDescriptorPaginator *paginator) {
    if (result.isSuccessful) {
        NSArray<TCHChannelDescriptor *> *items = [paginator items];
        // << consume the items in your UI >>

        // You can either obtain the next page immediately or wait
        // until the user scrolls to the bottom of the list before
        // requesting, depending on your use case.
        if (paginator.hasNextPage) {
            [paginator requestNextPageWithCompletion:completion];
        }
    } else {
        // report the error to the user
    }
};
_completion = completion;
[channelsList publicChannelsWithCompletion:completion];