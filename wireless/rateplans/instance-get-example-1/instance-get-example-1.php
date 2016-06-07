<?php
// Download the **Next-Gen** twilio-php library from:
// twilio.com/docs/libraries/php#installation-nextgen

// Include dependencies from Composer's autoload (including Twilio library)
include 'vendor/autoload.php';

$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";  // Your Account SID from www.twilio.com/console
$token = "{{ auth_token }}"; // Your Auth Token from www.twilio.com/console

$client = new Twilio\Rest\Client($sid, $token);

$plan = $client->preview->wireless->ratePlans(
  "WP467fb57a0aba9641a8209136d42545f8")->fetch();

echo $plan->sid, "\n";
echo $plan->alias, "\n";