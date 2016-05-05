<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "{{ auth_token }}";
$workspaceSid = "{{ workspace_sid }}";

$client = new TaskRouter_Services_Twilio($accountSid, $authToken, null);

$params = array();
$params['EventCallbackUrl'] = 'http://requestb.in/vh9reovh';
$params['Template'] = 'FIFO';

$workspace = $client->workspaces->create("NewWorkspace", $params);
echo $workspace->friendly_name;