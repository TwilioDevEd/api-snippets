from twilio.twiml.voice_response import Dial, Number, VoiceResponse

response = VoiceResponse()
dial = Dial()
dial.number('415-123-4567', url='http://example.com/agent_screen_call')
response.append(dial)

print(response)
