<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Find your credentials at twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$apiKeySid = getenv('TWILIO_API_KEY');
$apiKeySecret = getenv('TWILIO_API_KEY_SECRET');
$client = new Client($apiKeySid, $apiKeySecret);

$client->video->rooms('RMXXXX')->participants('Customer')
->subscribeRules->update(
    'rules' =>   array(
                        array("type" => "include", "all" => true),
                        array("type" => "exclude", "publisher" => "Supervisor")
                      )
);

echo 'Subscribe Rules updated successfully';

//-------------------------------------------------------------------------------
//1. At connect time Adam wants to receive all the tracks.
//   Done by default rule. No further actions required.


//-------------------------------------------------------------------------------
//2. After a while, Adam notices his bandwidth consumption is too high and
//   decides to unsubscribe from all video tracks

$client->video->rooms('RMXXXX')->participants('Adam')
->subscribeRules->update(
    'rules' =>   array(
                        array("type" => "include", "kind" => "audio"),
                      )
);
echo 'Subscribe Rules updated successfully';


//-------------------------------------------------------------------------------
//3. Later, a video screenshare track with SID MTXXXX is published to the room
//   and Adam subscribes to it.

$client->video->rooms('RMXXXX')->participants('Adam')
->subscribeRules->update(
    'rules' =>   array(
                        array("type" => "include", "kind" => "audio"),
                        array("type" => "include", "track" => "MTXXXX")
                      )
);
echo 'Subscribe Rules updated successfully';


//-------------------------------------------------------------------------------
//4. John, another participant, is in a noisy place and his audio track is
//   annoying. Adam decides to unsubscribe from it.

$client->video->rooms('RMXXXX')->participants('Adam')->subscribeRules->update(
    'rules' =>   array(
                        array("type" => "include", "kind" => "audio"),
                        array("type" => "include", "track" => "MTXXXX"),
                        array("type" => "exclude", "publisher" => "John", "kind" => "audio")
                      )
);
echo 'Subscribe Rules updated successfully';
