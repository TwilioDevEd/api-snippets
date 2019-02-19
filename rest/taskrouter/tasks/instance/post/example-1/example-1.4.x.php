<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$taskSid = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$client = new TaskRouter_Services_Twilio($accountSid, $authToken, $workspaceSid);

// update a task's attributes
$task = $client->workspace->tasks->get($taskSid);
$task->update(
	array(
		'Attributes' => '{"type":"support"}'
	)
);

// cancel a task
$task->update(
	array(
		'AssignmentStatus' => 'canceled',
		'Reason' => 'waiting too long'
	)
);
