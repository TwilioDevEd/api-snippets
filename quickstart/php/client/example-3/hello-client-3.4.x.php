<?php
include 'Services/Twilio/Capability.php';

// put your Twilio API credentials here
$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$authToken  = 'your_auth_token';

// put your Twilio Application Sid here
$appSid     = 'APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

$capability = new Services_Twilio_Capability($accountSid, $authToken);
$capability->allowClientOutgoing($appSid);
$capability->allowClientIncoming('joey');
$token = $capability->generateToken();
?>

<!DOCTYPE html>
<html>
  <head>
    <title>Hello Client Monkey 3</title>
    <script type="text/javascript"
      src="//media.twiliocdn.com/sdk/js/client/v1.3/twilio.min.js"></script>
    <script type="text/javascript"
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
    </script>
    <link href="//static0.twilio.com/resources/quickstart/client.css"
      type="text/css" rel="stylesheet" />
    <script type="text/javascript">

      Twilio.Device.setup("<?php echo $token; ?>");

      Twilio.Device.ready(function (device) {
        $("#log").text("Ready");
      });

      Twilio.Device.error(function (error) {
        $("#log").text("Error: " + error.message);
      });

      Twilio.Device.connect(function (conn) {
        $("#log").text("Successfully established call");
      });

      Twilio.Device.disconnect(function (conn) {
        $("#log").text("Call ended");
      });

      Twilio.Device.incoming(function (conn) {
        $("#log").text("Incoming connection from " + conn.parameters.From);
        // accept the incoming connection and start two-way audio
        conn.accept();
      });

      function call() {
        Twilio.Device.connect();
      }

      function hangup() {
        Twilio.Device.disconnectAll();
      }
    </script>
  </head>
  <body>
    <button class="call" onclick="call();">
      Call
    </button>

    <button class="hangup" onclick="hangup();">
      Hangup
    </button>
        
    <div id="log">Loading pigeons...</div>
  </body>
</html>