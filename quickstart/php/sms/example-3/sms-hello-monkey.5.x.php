<?php
// Get the Twilio-PHP helper library from twilio.com/docs/libraries/php,
// following the instructions to install it with Composer.
require_once "vendor/autoload.php";
use Twilio\Twiml;

$response = new Twiml();
$response->message('Hello, Mobile Monkey');

header("content-type: text/xml");
echo $response;
