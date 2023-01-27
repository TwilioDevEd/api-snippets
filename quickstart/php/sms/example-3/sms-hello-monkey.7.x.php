<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
// following the instructions to install it with Composer.
require_once "vendor/autoload.php";
use Twilio\TwiML\MessagingResponse;

$response = new MessagingResponse();
$response->message('Hello, Mobile Monkey');

header("content-type: text/xml");
echo $response;
