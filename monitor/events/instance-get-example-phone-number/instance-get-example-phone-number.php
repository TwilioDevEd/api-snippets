<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "AC3094732a3c49700934481addd5ce1659";
$token = "{{ auth_token }}";
$client = new Monitor_Services_Twilio($sid, $token);

$event = $client->events->get("AE21f24380625e4aa4abec76e39b14458d");
echo $event->description;
