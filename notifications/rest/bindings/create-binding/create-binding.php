<?php
// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/php
require './vendor/autoload.php';

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "{{ account_sid }}"; 
$token = "{{ auth_token }}"; 

// Initialize the client
$client = new Twilio\Rest\Client($sid, $token);

$service = $client->notifications->v1->services("ISxxx");

$binding = $service->bindings->create("xxx", "bob", "gcm", "xxx", array("tag" => "premium"));

print_r($binding);
 