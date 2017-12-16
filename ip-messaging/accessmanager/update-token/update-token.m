[chatClient updateToken:token completion:^(TCHResult *result) {
  if (![result isSuccessful]) {
    // warn the user the update didn't succeed
  }
}];