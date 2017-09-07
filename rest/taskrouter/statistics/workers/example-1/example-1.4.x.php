<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$workerSid = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$client = new TaskRouter_Services_Twilio($accountSid, $authToken, $workspaceSid);

$statistics = $client->getWorkerStatistics(
    $workerSid,
    array(
        'Minutes' => 60
    )
);
echo $statistics->cumulative->reservations_accepted;
