from twilio.twiml.voice_response import Connect, Conversation, VoiceResponse

response = VoiceResponse()
connect = Connect(action='https://your-action-url.com/', method='GET')
connect.conversation(service_instance_sid='ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
response.append(connect)

print(response)
