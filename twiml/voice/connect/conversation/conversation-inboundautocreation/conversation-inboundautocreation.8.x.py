from twilio.twiml.voice_response import Connect, Conversation, VoiceResponse

response = VoiceResponse()
connect = Connect()
connect.conversation(
    service_instance_sid='ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
    inbound_autocreation=True)
response.append(connect)

print(response)
