<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require("Services/Twilio.php");
$response = new Services_Twilio_Twiml;
$dial = $response->dial();
$dial->queue('Queue Demo');
print $response;
