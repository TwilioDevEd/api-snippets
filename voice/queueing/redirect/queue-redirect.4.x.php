<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require("Services/Twilio.php");
$response = new Services_Twilio_Twiml;
$response->say("You will now be connected to the first caller in the queue.");
$dial = $response->dial();
$dial->queue("Queue Demo");
$response->redirect();
print $response;
