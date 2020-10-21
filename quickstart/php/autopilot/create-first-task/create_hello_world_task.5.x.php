<?php
// Download the helper library from https://www.twilio.com/docs/php/install
// Update the path below to your autoload.php if not installed in local dir.
// see https://getcomposer.org/doc/01-basic-usage.md
require_once './vendor/autoload.php';
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$sid    = getenv('TWILIO_ACCOUNT_SID');
$token  = getenv('TWILIO_AUTH_TOKEN');
$twilio = new Client($sid, $token);

// Build task actions that say something and listens for a repsonse.
$helloWorldTaskActions = array(
    "actions" => array(
        array("say" => "Hi there, I'm your virtual assistant! How can I help you?"),
        array("listen" => true),
    )
);

// Create the hello_world task
// Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
$task = $twilio->autopilot->v1->assistants("UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
                              ->tasks
                              ->create("hello-world", array(
                                  "friendlyName" => "Hello World",
                                  "actions" => $helloWorldTaskActions,
                              ));

print($task->sid);
?>
