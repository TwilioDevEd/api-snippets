<?php
// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/php
require_once 'vendor/autoload.php';

use Twilio\Rest\Client;

// Your Account SID from www.twilio.com/console
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
// Your Auth Token from www.twilio.com/console
$token = "your_auth_token";

$client = new Client($sid, $token);

$doc = $client->preview->sync
    ->services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->documents("MyFirstDocument")->update(
        array(
            'data' => '{ "date_updated": "2016-07-06T12:46:38Z", 
                "movie_title": "On The Line", 
                "showtimes": null, 
                "starring": ["Lance Bass", "Joey Fatone"], 
                "genre": "Romance"}'
        )
    );

print_r($doc->data);
echo PHP_EOL;