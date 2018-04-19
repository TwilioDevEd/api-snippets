<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$taskQueueSid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$client = new TaskRouter_Services_Twilio($accountSid, $authToken, $workspaceSid);

$statistics = $client->getTaskQueueStatistics(
    $taskQueueSid,
    array(
        'Minutes' => 60
    )
);
echo $statistics->cumulative->reservations_accepted;