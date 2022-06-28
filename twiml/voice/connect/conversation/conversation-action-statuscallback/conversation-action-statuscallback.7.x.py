from twilio.twiml.voice_response import Connect, Conversation, VoiceResponse

response = VoiceResponse()
connect = Connect(action='https://your-action-url.com/')
connect.conversation(
    service_instance_sid='ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
    status_callback='https://your-status-callback-url.com/statusCallback')
response.append(connect)

print(response)
