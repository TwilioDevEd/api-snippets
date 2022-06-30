from twilio.twiml.voice_response import Connect, Conversation, VoiceResponse

response = VoiceResponse()
connect = Connect()
connect.conversation(
    service_instance_sid='ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
    status_callback='https://example.com/yourStatusCallback',
    status_callback_event=
    'call-initiated call-in-progress call-ringing call-completed')
response.append(connect)

print(response)
