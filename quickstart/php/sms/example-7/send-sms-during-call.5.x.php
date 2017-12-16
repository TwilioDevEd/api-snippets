<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
// following the instructions to install it with Composer.
require_once "vendor/autoload.php";
use Twilio\Twiml;

// make an associative array of callers we know, indexed by phone number
$people = array(
  "+14158675308" => "Curious George",
  "+14158675310" => "Boots",
  "+14158675311" => "Virgil"
);

// if the caller is known, then greet them by name
// otherwise, consider them just another monkey
$name = $people[$_REQUEST['From']] ?: 'Monkey';

$response = new Twiml();
$response->say("Hello {$name}");
$response->message("{$name}, thanks for the call!");

header("content-type: text/xml");
echo $response;
