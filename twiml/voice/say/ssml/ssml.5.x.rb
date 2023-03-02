require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say(voice: 'Polly.Joanna', message: 'Hi') do |say|
  say.break(strength: 'x-weak', time: '100ms')
  say.emphasis(words: 'Words to emphasize', level: 'moderate')
  say.p(words: 'Words to speak')
  say.add_text('aaaaaa')
  say.phoneme('Words to speak', alphabet: 'x-sampa', ph: 'pɪˈkɑːn')
  say.add_text('bbbbbbb')
  say.prosody(words: 'Words to speak', pitch: '-10%', rate: '85%', volume: '-6dB')
  say.s(words: 'Words to speak')
  say.say_as('Words to speak', interpretAs: 'spell-out')
  say.sub('Words to be substituted', alias: 'alias')
  say.w(words: 'Words to speak')
end

puts response
