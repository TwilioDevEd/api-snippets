<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$client = new Client($accountSid, $authToken);

$workspace = $client->taskrouter->workspaces()->getContext($workspaceSid);

$taskParams = array(
    "AssignmentStatus" => "pending",
    "TaskQueueSid" => "WQf855e98ad280d0a0a325628e24ca9627"
);

$tasks = $workspace->tasks->stream($taskParams);

foreach ($tasks as $task) {
    echo $task->attributes;
}
