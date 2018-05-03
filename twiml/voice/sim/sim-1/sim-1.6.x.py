from twilio.twiml.voice_response import Dial, VoiceResponse, Sim

response = VoiceResponse()
dial = Dial()
dial.sim('DE8caa2afb9d5279926619c458dc7098a8')
response.append(dial)

print(response)
