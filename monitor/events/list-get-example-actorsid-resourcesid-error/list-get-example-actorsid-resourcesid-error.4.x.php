<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Monitor_Services_Twilio($sid, $token);

$params = array(
    'ActorSid' => 'USd0afd67cddff4ec7cb0022771a203cb1',
    'ResourceSid' => 'PN4aa51b930717ea83c91971b86d99018f'
);
$events = $client->events->getIterator(0, 50, $params);
foreach ($events as $e) {
    echo $e->description;
}
