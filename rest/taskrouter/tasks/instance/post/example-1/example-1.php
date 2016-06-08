<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "{{ auth_token }}";
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$taskSid = "{{ task_sid }}";

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
