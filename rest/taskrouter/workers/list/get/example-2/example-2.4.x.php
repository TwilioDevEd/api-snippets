<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$client = new TaskRouter_Services_Twilio($accountSid, $authToken, $workspaceSid);

$workers = $client->workspace->workers->getIterator(null, null, array("Available" => "1", "TaskQueueSid" => "WQf855e98ad280d0a0a325628e24ca9627"));
foreach($workers as $worker) {
	print_r("worker: ".$worker->friendly_name);
}
