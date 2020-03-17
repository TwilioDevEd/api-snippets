<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
// following the instructions to install it with Composer.
require_once "vendor/autoload.php";
use Twilio\TwiML\MessagingResponse;

$response = new MessagingResponse();
$message = $response->message();
$message->body('Hello, Mobile Monkey');
$message->media('https://demo.twilio.com/owl.png');

header("content-type: text/xml");
echo $response;
