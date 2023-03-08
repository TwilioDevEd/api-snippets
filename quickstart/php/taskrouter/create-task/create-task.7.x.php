<?php
// Get the Twilio-PHP library from twilio.com/docs/libraries/php,
// following the instructions to install it with Composer.
require_once "vendor/autoload.php";
use Twilio\Rest\Client;

// put your Twilio API credentials here
// To set up environmental variables, see http://twil.io/secure
$accountSid = getenv('TWILIO_ACCOUNT_SID');
$authToken  = getenv('TWILIO_AUTH_TOKEN');

// Set your WorkspaceSid and WorkflowSid
$workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$workflowSid = 'WWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

// instantiate a new Twilio Rest Client
$client = new Client($accountSid, $authToken);

// create a new task
$task = $client->taskrouter
    ->workspaces($workspaceSid)
    ->tasks
    ->create(array(
      'attributes' => '{"selected_language": "es"}',
      'workflowSid' => $workflowSid,
    ));


// display a confirmation message on the screen
echo "Created a new task";
