<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$client = new TaskRouter_Services_Twilio($accountSid, $authToken, $workspaceSid);

$params = array();
$params['Attributes'] = '{"type":"support"}';

$worker = $client->workspace->workers->create("Support Worker 1", $params);
echo $worker->friendly_name;