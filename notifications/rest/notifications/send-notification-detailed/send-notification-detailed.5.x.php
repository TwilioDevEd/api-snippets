<?php
// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Your Account SID and Auth Token from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$accountSid = getenv('TWILIO_ACCOUNT_SID');
$authToken = getenv('TWILIO_AUTH_TOKEN');

$serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

// Initialize the client
$client = new Client($accountSid, $authToken);

// Create a detailed notification
$notification = $client
    ->notify->services($serviceSid)
    ->notifications->create([
        "identity" => "00000001",
        "title" => "Generic loooooooong title for all Bindings",
        "body" => "This is the body for all Bindings",
        "data" => '{"custom_key1":"custom value 1","custom_key2":"custom value 2"}',
        "fcm" => '{"notification":{"title":"New alert","body":"Hello Bob!"}}',
        "apn" => '{"aps":{"alert":{"title":"New alert","body":"Hello Bob!"}}}'
    ]);

echo $notification->body; // => This is the body for all Bindings
