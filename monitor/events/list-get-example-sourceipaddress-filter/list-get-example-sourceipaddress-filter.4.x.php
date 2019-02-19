<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Monitor_Services_Twilio($sid, $token);

$params = array(
    'SourceIpAddress' => '104.14.155.29',
    'StartDate' => '2015-04-25T00:00:00Z',
    'EndDate' => '2015-04-25T23:59:59Z'
);
$events = $client->events->getIterator(0, 50, $params);
foreach ($events as $e) {
    echo $e->description;
}
