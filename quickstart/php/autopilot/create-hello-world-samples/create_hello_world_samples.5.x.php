<?php
// Download the helper library from https://www.twilio.com/docs/php/install
// Update the path below to your autoload.php,
// see https://getcomposer.org/doc/01-basic-usage.md
require_once '/path/to/vendor/autoload.php';
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/console
$sid    = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token  = "your_auth_token";
$twilio = new Client($sid, $token);

$phrases = array(
    "hi",
    "hello",
    "Hello",
    "Hi there",
);

// Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list

foreach ($phrases as $phrase) {
    $sample = $twilio->autopilot->v1->assistants("UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
                                    ->tasks("hello-world")
                                    ->samples
                                    ->create(
                                        $language = "en-us",
                                        $taggedText = $phrase,
                                    );
    print($sample->sid);

}
?>
