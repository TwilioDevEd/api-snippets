do {
    try self.conversation?.invite("Charles");
} catch {
    print(error);
}