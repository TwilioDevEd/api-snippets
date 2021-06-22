<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$say = $response->say('Hi', ['voice' => 'Polly.Joanna']);
$say->break_(['strength' => 'x-weak', 'time' => '100ms']);
$say->emphasis('Words to emphasize', ['level' => 'moderate']);
$say->p('Words to speak');
$say->append('aaaaaa');
$say->phoneme('Words to speak', ['alphabet' => 'x-sampa', 'ph' => 'pɪˈkɑːn']);
$say->append('bbbbbbb');
$say->prosody('Words to speak', ['pitch' => '-10%', 'rate' => '85%',
    'volume' => '-6dB']);
$say->s('Words to speak');
$say->say_as('Words to speak', ['interpret-as' => 'spell-out']);
$say->sub('Words to be substituted', ['alias' => 'alias']);
$say->w('Words to speak');

echo $response;
