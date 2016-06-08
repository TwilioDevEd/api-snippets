<?php
// Download the **Next-Gen** twilio-php library from:
// twilio.com/docs/libraries/php#installation-nextgen

// Include dependencies from Composer's autoload (including Twilio library)
include 'vendor/autoload.php';

$sid = "{{ account_sid }}";  // Your Account SID from www.twilio.com/console
$token = "{{ auth_token }}"; // Your Auth Token from www.twilio.com/console

$client = new Twilio\Rest\Client($sid, $token);

$device = $client->preview->wireless->devices->create(
  array(
    'alias' => "996224413905003",
    'friendlyName' => "Charlie's SmartMeter",
    'ratePlan' => "{{ rate_plan_sid }}"
  )
);

print $device->friendlyName;