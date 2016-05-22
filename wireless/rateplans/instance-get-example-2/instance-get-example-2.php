<?php
// Download the **Next-Gen** twilio-php library from:
// twilio.com/docs/libraries/php#installation-nextgen

// Include dependencies from Composer's autoload (including Twilio library)
include 'vendor/autoload.php';

$sid = "{{ account_sid }}";  // Your Account SID from www.twilio.com/console
$token = "{{ auth_token }}"; // Your Auth Token from www.twilio.com/console

$client = new Twilio\Rest\Client($sid, $token);

$plan = $client->preview->wireless->ratePlans(
  "us-automotive")->fetch();

echo $plan->sid, "\n";
echo $plan->alias, "\n";