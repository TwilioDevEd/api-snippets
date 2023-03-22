from twilio.twiml.voice_response import Connect, Conversation, VoiceResponse

response = VoiceResponse()
connect = Connect()
connect.conversation(
    service_instance_sid='ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
    record='record-from-answer',
    trim='trim-silence')
response.append(connect)

print(response)
