from twilio.twiml.voice_response import Redirect, VoiceResponse

response = VoiceResponse()
response.redirect('http://pigeons.com/twiml.xml', method='POST')

print(response)
