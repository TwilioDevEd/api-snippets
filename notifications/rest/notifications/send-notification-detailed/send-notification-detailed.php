<?php
// Get the PHP helper library from twilio.com/docs/php/install
require './vendor/autoload.php';

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; 
$token = "{{ auth_token }}"; 

// Initialize the client
$client = new Twilio\Rest\Client($sid, $token);

$service = $client->notifications->v1->services("ISxxx");

$notification = $service->notifications->create(array(
    identity => "Bob", 
    title => "Generic loooooooong title for all Bindings", 
    body => "This is the body for all Bindings", 
    gcm => '{"notification":{"tag":"MyTag"}}', 
    apn => '{"aps":{"title":"Short title for Watch."}}'
));

print print_r($notification, true);
 