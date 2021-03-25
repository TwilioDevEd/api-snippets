<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php

require_once 'vendor/autoload.php'; // Loads the library
use Twilio\TwiML\MessagingResponse;

$response = new MessagingResponse;
$body = $_REQUEST['Body'];
$default = "I just wanna tell you how I'm feeling - Gotta make you understand";
$options = [
  "give you up",
  "let you down",
  "run around and desert you",
  "make you cry",
  "say goodbye",
  "tell a lie, and hurt you"
  ];

if (strtolower($body) == 'never gonna') {
    $response->message($options[array_rand($options)]);
} else {
    $response->message($default);
}
print $response;
