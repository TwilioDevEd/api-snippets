<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$client = new TaskRouter_Services_Twilio($accountSid, $authToken, null);

$params = array();
$params['EventCallbackUrl'] = 'http://requestb.in/vh9reovh';
$params['Template'] = 'FIFO';

$workspace = $client->workspaces->create("NewWorkspace", $params);
echo $workspace->friendly_name;