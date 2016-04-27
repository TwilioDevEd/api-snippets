# Getting Started with Network Traversal Service

Twilio’s Network Traversal Service is a globally distributed STUN/TURN service
that helps you deploy more reliable peer-to-peer communications applications.
You can use this service in your WebRTC and VoIP applications for traversal and
relay around NAT/firewalls, so that your users make a successful connection
every time.

If you're new to STUN/TURN and ICE, check out the
[Frequently Asked Questions][1]. If you want to start using Twilio's Network
Traversal Service immediately, here's what you need to do.

### Using Network Traversal Service in a WebRTC application {#list-post-example}
Using Network Traversal Service in a WebRTC application is as easy as requesting
a token and passing it to your RTCPeerConnection constructor.

First, make a request from your web server to retrieve a
[Network Traversal Service Token][2] and pass it to your WebRTC application.

<div class="alert alert-error">
Important: You'll need to use your Twilio AccountSid and AuthToken to get a
Network Traversal Service Token. You should only make this request from
your server and not the client browser to keep your Twilio account credentials
safe.
</div>

<div class="md-code-sample"
    id="list-post-example"
    data-title="Generate NTS Token"
    data-href="api/stun-turn/list-post-example"
    data-pref="server">
</div>

Next, include the "ice_servers" property in the RTCConfiguration object you pass
to the RTCPeerConnection constructor when setting up a call, as shown below
(where ICE_SERVERS is the contents of the "ice_servers" property returned in the
response above):

<pre class="notranslate brush: javascript">
// Here's an example in javascript
myIceServers = ICE_SERVERS;
var configuration = { iceServers: myIceServers };
var pc = new RTCPeerConnection(configuration);
</pre>

From this point forward, exchange SDP offer/answers as you normally would.
Congrats, you've now used Network Traversal Service to setup a connection!

If the browser you're using supports Trickle ICE, you'll also want to handle
the RTCPeerConnection's onIceCandidate event to pass any new ICE candidates to
the connected peer:

<pre class="notranslate brush: javascript">
// Here's an example in javascript
pc.onicecandidate = function (evt) {
  if (evt.candidate) {
    // send the candidate to the other party via your signaling channel
  }
};
</pre>

That's all there is to it! If you need more help, check out the
[Frequently Asked Questions][1], or contact Twilio support at help@twilio.com.

### Using Network Traversal Service in a VoIP client {#voip-client}
<div class="alert alert-error">
Important: In order to use Network Traversal Service in a VoIP client, you'll
need to be able to make an HTTP request from your VoIP client or another
application at least once every 24 hours to retrieve a new ephemeral token.
</div>

To use Network Traversal Service with a VoIP Client you'll do the following:

1.  Retrieve a Network Traversal Service Token.
2.  Retrieve the STUN and TURN URLs from the returned data, along with the
	username and credential values.
3.  Configure your VoIP client with these values.

[Network Traversal Service Tokens][2] are good for a maximum and default value
of one day. You can reduce the token expiration time by using the `Ttl`
parameter when you request the token. Find out more in the
[Network Traversal Service Token][2] documentation here.

 [1]: /docs/stun-turn/faq
 [2]: /docs/api/2010-04-01/rest/token
