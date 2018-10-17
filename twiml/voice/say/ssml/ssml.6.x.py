from twilio.twiml.voice_response import Say, VoiceResponse

response = VoiceResponse()
say = Say('Hi', voice='Polly.Joanna')
say.ssml_break(strength='x-weak', time='100ms')
say.ssml_emphasis('Words to emphasize', level='moderate')
say.ssml_p('Words to speak')
say.append('aaaaaa')
say.ssml_phoneme('Words to speak', alphabet='x-sampa', ph='pɪˈkɑːn')
say.append('bbbbbbb')
say.ssml_prosody('Words to speak', pitch='-10%', rate='85%', volume='-6dB')
say.ssml_s('Words to speak')
say.ssml_say_as('Words to speak', interpret_as='spell-out')
say.ssml_sub('Words to be substituted', alias='alias')
say.ssml_w('Words to speak')
response.append(say)

print(response)
