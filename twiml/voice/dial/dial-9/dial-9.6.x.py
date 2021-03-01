from twilio.twiml.voice_response import Dial, VoiceResponse, Sip

response = VoiceResponse()
dial = Dial(answer_on_bridge=True, refer_url='https://example.com/handler')
dial.sip(
    'sip:AgentA@xyz.sip.us1.twilio.com?User-to-User=123456789%3Bencoding%3Dhex&X-Name=Agent%2C+A'
)
response.append(dial)

print(response)
