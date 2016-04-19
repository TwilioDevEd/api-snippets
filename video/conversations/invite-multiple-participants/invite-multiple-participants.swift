let clients: [String] = ["Charles", "Dena"]

do {
    try self.conversation?.inviteMany(clients)
} catch {
    print(error);
}