<?php
// Get the PHP helper library from twilio.com/docs/php/install
require("Services/Twilio.php");
$response = new Services_Twilio_Twiml;
$dial = $response->dial();
$dial->queue('Queue Demo');
print $response;
