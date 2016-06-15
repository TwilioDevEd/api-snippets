<?php
// Download the **Next-Gen** twilio-php library from:
// twilio.com/docs/libraries/php#installation-nextgen

// Include dependencies from Composer's autoload (including Twilio library)
include 'vendor/autoload.php';

$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";  // Your Account SID from www.twilio.com/console
$token = "your_auth_token"; // Your Auth Token from www.twilio.com/console

$client = new Twilio\Rest\Client($sid, $token);

$usage = $client->preview->wireless->devices(
  "524116518656369")->usage()->fetch(array(
    'start' => "2016-05-01",
	'end' => "2016-05-01"
  ));

echo $usage->period['start'], "\n";
echo $usage->period['end'], "\n";
echo $usage->dataCosts['total'], "\n";