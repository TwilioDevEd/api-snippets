from twilio.twiml.voice_response import Enqueue, VoiceResponse, Say

response = VoiceResponse()
response.enqueue('support', wait_url='wait.xml')
response.say(
    'Unfortunately, the support line has closed. Please call again tomorrow.'
)

print(response)
