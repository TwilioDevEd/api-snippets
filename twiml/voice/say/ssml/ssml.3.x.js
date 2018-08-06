const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const say = response.say(
  {
    voice: 'Polly.Joanna'
  },
  'Hi'
);
say.ssmlBreak({
  strength: 'x-weak',
  time: '100ms'
});
say.ssmlEmphasis(
  {
    level: 'moderate'
  },
  'Words to emphasize'
);
say.ssmlP('Words to speak');
say.addText('aaaaaa');
say.ssmlPhoneme(
  {
    alphabet: 'x-sampa',
    ph: 'pɪˈkɑːn'
  },
  'Words to speak'
);
say.addText('bbbbbbb');
say.ssmlProsody(
  {
    pitch: '-10%',
    rate: '85%',
    volume: '-6dB'
  },
  'Words to speak'
);
say.ssmlS('Words to speak');
say.ssmlSayAs(
  {
    'interpret-as': 'spell-out',
    role: 'yyyymmdd'
  },
  'Words to speak'
);
say.ssmlSub(
  {
    alias: 'alias'
  },
  'Words to be substituted'
);
say.ssmlW('Words to speak');

console.log(response.toString());
