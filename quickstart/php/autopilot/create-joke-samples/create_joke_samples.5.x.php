<?php
// Download the helper library from https://www.twilio.com/docs/php/install
// Update the path below to your autoload.php if not installed in local dir.
// see https://getcomposer.org/doc/01-basic-usage.md
require_once './vendor/autoload.php';
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$sid    = getenv('TWILIO_ACCOUNT_SID');
$token  = getenv('TWILIO_AUTH_TOKEN');
$twilio = new Client($sid, $token);

$phrases = array(
    "Tell me a joke",
    "Tell me a joke",
    "I\'d like to hear a joke",
    "Do you know any good jokes?",
    "Joke",
    "Tell joke",
    "Tell me something funny",
    "Make me laugh",
    "I want to hear a joke",
    "Can I hear a joke?",
    "I like jokes",
    "I\'d like to hear a punny joke",
);

// Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
foreach ($phrases as $phrase) {
    $sample = $twilio->autopilot->v1->assistants("UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
                                    ->tasks("tell-a-joke")
                                    ->samples
                                    ->create(
                                        $language = "en-us",
                                        $taggedText = $phrase
                                    );

    print($sample->sid);
}
