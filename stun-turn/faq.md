# Frequently Asked Questions


##What are STUN, TURN, and ICE? {#faq-what-is-nat}
STUN, TURN, and ICE are a set of IETF standard protocols for negotiating
traversing NATs when establishing peer-to-peer communication sessions. WebRTC
and other VoIP stacks implement support for ICE to improve the reliability of IP
communications.

A host uses **Session Traversal Utilities for NAT (STUN)** to discover its
public IP address when it is located behind a NAT/Firewall. When this host wants
to receive an incoming connection from another party, it provides this public IP
address as a possible location where it can receive a connection. If the
NAT/Firewall still won't allow the two hosts to connect directly, they make a
connection to a server implementing **Traversal Using Relay around NAT (TURN)**,
which will relay media between the two parties.

**Interactive Connectivity Establishment (ICE)** is a blanket standard that
describes how to coordinate STUN and TURN to make a connection between hosts.
Twilio's Network Traversal Service implements STUN and TURN for ICE-compatible
clients, such as browsers supporting the WebRTC standard.

Want to learn more? Check out the following RFCs:

*  ICE ([RFC5245][1])
*  STUN ([RFC5389][2])


## How do STUN, TURN and ICE work? {#faq-how-does-nat-work}
Let's assume our users, Alice and Bob, are both using a WebRTC video chat
application, and that Alice wants to call Bob. Here's what happens next.

To connect to Bob's browser, Alice's browser needs to generate a
**Session Description Protocol (SDP)** offer. The SDP generation process begins
when the application she's using calls `createOffer` on an `RTCPeerConnection`
object.

An SDP offer contains a bunch of information about the session Alice's browser
wants to establish–what codecs to use, whether this will be an audio or video
session, and more. It also contains a list of **ICE candidates**, which are the
IP and port pairs that Bob's browser can attempt to use to connect to Alice.

To build the list of ICE candidates, Alice's browser makes a series of requests
to a **STUN server**. The server returns the public IP address and port pair
that originated the request. Alice's browser adds each pair to the list of ICE
candidates. This process is called **gathering ICE candidates**. Once Alice's
browser has finished gathered ICE candidates, it can return an SDP.

Next, Alice's browser needs to pass the SDP to Bob's browser through a signaling
channel between the browsers–WebRTC leaves this signaling implementation up to
the developer. The ins and outs of signaling are beyond the scope of this
discussion, but let's assume Bob receives Alice's SDP offer via some signaling
channel.

Now, Bob's browser needs to generate an **SDP answer**. Bob's browser follows
the same steps Alice's browser used above: gathering ICE candidates, etc. Bob's
browser then needs to return this SDP answer to Alice's browser.

Once Alice and Bob have exchanged SDPs, they then perform a series of
**connectivity checks**. The ICE algorithm in each browser takes a candidate
IP/port pair from the list it received in the other party's SDP, and sends it a
STUN request. If a response comes back from the other browser, the originating
browser considers the check successful and will mark that IP/port pair as a
valid ICE candidate.

After connectivity checks have finished on all of the IP/port pairs, the
browsers negotiate and decide to use one of the remaining, valid pairs. Once a
pair is selected, media begins flowing between the browsers. This entire process
usually takes milliseconds.

If the browsers can't find an IP/port pair that passes connectivity checks,
they'll make STUN requests to the TURN server to obtain a media relay address. A
relay address is a public IP address and port that will forward packets received
to and from the browser the setup the relay address. This relay address is then
added to the candidate list and exchanged via the signaling channel.


If you're building a WebRTC application, the WebRTC stack includes an ICE Agent
that takes care of most of this for you. You just need to implement a
signaling mechanism to exchange SDPs and send along new ICE candidates whenever
they're discovered.


## How can I troubleshooting ICE negotiation in my application? {#faq-troubleshoot}

### Using Google Chrome {#faq-troubleshoot-chrome}
In a new tab, open chrome://webrtc-internals. In a separate tab, make a WebRTC
call using your application. In the webrtc-internals page, you'll see a tab for
each active `PeerConnection` object. That page lists the ICE negotiation events
that took place when attempting to setup the call (`iceGatheringStateChange`,
`onIceCandidate`, etc.). You can expand each node in the tree to see more detail
about the event.

### Using Firefox {#faq-troubleshoot-firefox}
In a new tab, open about:webrtc. In a separate tab, make a WebRTC call using
your application. In the about:webrtc page click the Connection Log button.
This will reveal a log of events. Search for ICE and STUN/TURN events by
searching for the string 'ICE' in this log file.

 [1]: http://www.ietf.org/rfc/rfc5245.txt
 [2]: http://www.ietf.org/rfc/rfc5389.txt
