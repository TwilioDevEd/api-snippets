from twilio.twiml.voice_response import VoiceResponse, Say

response = VoiceResponse()
say = Say('Hi', voice='Polly.Joanna')
say.break_(strength='x-weak', time='100ms')
say.emphasis('Words to emphasize', level='moderate')
say.p('Words to speak')
say.append('aaaaaa')
say.phoneme('Words to speak', alphabet='x-sampa', ph='pɪˈkɑːn')
say.append('bbbbbbb')
say.prosody('Words to speak', pitch='-10%', rate='85%', volume='-6dB')
say.s('Words to speak')
say.say_as('Words to speak', interpret_as='spell-out', role='yyyymmdd')
say.sub('Words to be substituted', alias='alias')
say.w('Words to speak')
response.append(say)

print(response)
