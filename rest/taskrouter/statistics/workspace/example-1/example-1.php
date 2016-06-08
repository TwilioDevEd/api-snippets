<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "{{ auth_token }}";
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$client = new TaskRouter_Services_Twilio($accountSid, $authToken, $workspaceSid);

$statistics = $client->getWorkspaceStatistics($workspaceSid);
echo $statistics->cumulative->avg_task_acceptance_time;
echo $statistics->realtime->tasks_by_status->pending;
echo $statistics->realtime->tasks_by_status->assigned;
