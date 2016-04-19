extension ViewController: TwilioIPMessagingClientDelegate {
  func ipMessagingClient(client: TwilioIPMessagingClient!, channel: TMChannel!,
      memberChanged member: TMMember!) {
    print("Member changed: \(member.identity())")
  }
  
  func ipMessagingClient(client: TwilioIPMessagingClient!, channel: TMChannel!,
      memberJoined member: TMMember!) {
    print("Member joined: \(member.identity())")
  }
  
  func ipMessagingClient(client: TwilioIPMessagingClient!, channel: TMChannel!,
      memberLeft member: TMMember!) {
    print("Member left: \(member.identity())")
  }
}