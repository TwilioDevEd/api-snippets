const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const say = response.say({
    voice: 'Polly.Joanna'
}, 'Hi');
say.break({
    strength: 'x-weak',
    time: '100ms'
});
say.emphasis({
    level: 'moderate'
}, 'Words to emphasize');
say.p('Words to speak');
say.addText('aaaaaa')
say.phoneme({
    alphabet: 'x-sampa',
    ph: 'pɪˈkɑːn'
}, 'Words to speak');
say.addText('bbbbbbb')
say.prosody({
    pitch: '-10%',
    rate: '85%',
    volume: '-6dB'
}, 'Words to speak');
say.s('Words to speak');
say.sayAs({
    'interpret-as': 'spell-out',
    role: 'yyyymmdd'
}, 'Words to speak');
say.sub({
    alias: 'alias'
}, 'Words to be substituted');
say.w('Words to speak');

console.log(response.toString());
