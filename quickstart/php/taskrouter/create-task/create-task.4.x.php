<?php
// Download the Twilio-PHP library from twilio.com/docs/libraries/php,
// and move it into the folder containing this file.
require 'Services/Twilio.php';

// put your Twilio API credentials here
$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$authToken  = 'your_auth_token';

// Set your WorkspaceSid and WorkflowSid
$workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; 
$workflowSid = 'WWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; 

// instantiate a new Twilio TaskRouter Rest Client 
$taskrouterClient = new TaskRouter_Services_Twilio($accountSid, $authToken, $workspaceSid); 

// create a new task 
$taskrouterClient->workspace->tasks->create('{"selected_language": "es"}', $workflowSid); 

// display a confirmation message on the screen
echo "Created a new task";