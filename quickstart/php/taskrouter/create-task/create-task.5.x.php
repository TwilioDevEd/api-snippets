<?php
// Get the Twilio-PHP library from twilio.com/docs/libraries/php, 
// following the instructions to install it with Composer.
require_once "vendor/autoload.php";
use Twilio\Rest\Client;

// put your Twilio API credentials here
$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$authToken  = 'your_auth_token';

// Set your WorkspaceSid and WorkflowSid
$workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; 
$workflowSid = 'WWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; 

// instantiate a new Twilio Rest Client 
$client = new Client($accountSid, $authToken);

// create a new task 
$task = $client->taskrouter->workspaces()
    ->getContext($workspaceSid)
    ->tasks->create('{"selected_language": "es"}', $workflowSid); 

// display a confirmation message on the screen
echo "Created a new task";