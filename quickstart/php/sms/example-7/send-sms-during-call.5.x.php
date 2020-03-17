<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
// following the instructions to install it with Composer.
require_once "vendor/autoload.php";
use Twilio\TwiML\VoiceResponse;

// make an associative array of callers we know, indexed by phone number
$people = array(
  "+14158675308" => "Curious George",
  "+12349013030" => "Boots",
  "+12348134522" => "Virgil"
);

// if the caller is known, then greet them by name
// otherwise, consider them just another monkey
$name = $people[$_REQUEST['From']] ?: 'Monkey';

$response = new VoiceResponse();
$response->say("Hello {$name}");
$response->sms("{$name}, thanks for the call!");

header("content-type: text/xml");
echo $response;
