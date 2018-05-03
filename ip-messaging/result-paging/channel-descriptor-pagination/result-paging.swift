
func channelsCompletion(result: TCHResult?, paginator: TCHChannelDescriptorPaginator?) {
    let items = paginator?.items()

    if result!.isSuccessful() {
        // << consume the items in your UI >>

        // You can either obtain the next page immediately or wait
        // until the user scrolls to the bottom of the list before
        // requesting, depending on your use case.
      if paginator!.hasNextPage() {
        paginator?.requestNextPage(completion: completion)
      }
    } else {
      // report the error to the user
    }
  }

client.channelsList().publicChannelDescriptors(completion: channelsCompletion)
