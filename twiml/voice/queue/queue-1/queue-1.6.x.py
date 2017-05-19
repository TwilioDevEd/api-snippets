from twilio.twiml.voice_response import Dial, Queue, VoiceResponse

response = VoiceResponse()
dial = Dial()
dial.queue('support', url='about_to_connect.xml')
response.append(dial)

print(response)
