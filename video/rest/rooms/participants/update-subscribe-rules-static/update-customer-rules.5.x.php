<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Find your credentials at twilio.com/console
$apiKeySid = "SKXXXX";
$apiKeySecret = "your_auth_apiKeySecret";
$client = new Client($apiKeySid, $apiKeySecret);

$client->video->rooms('RMXXXX')->participants('Customer')
->subscribeRules->update(
    'rules' =>   array(
                        array("type" => "include", "all" => true),
                        array("type" => "exclude", "publisher" => "Supervisor")
                      )
);

echo 'Subscribe Rules updated successfully';
