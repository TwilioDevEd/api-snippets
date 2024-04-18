from twilio.twiml.voice_response import Connect, Conversation, VoiceResponse

response = VoiceResponse()
connect = Connect(action='https://example.com/yourActionUrl')
connect.conversation(
    service_instance_sid='ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
    status_callback='https://example.com/yourStatusCallback')
response.append(connect)

print(response)
