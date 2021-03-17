from twilio.twiml.voice_response import Connect, VoiceResponse, VirtualAgent

response = VoiceResponse()
connect = Connect(action='https://myactionurl.com/twiml')
connect.virtualagent(
    connector_name='project', statuscallback='https://mycallbackurl.com'
)
response.append(connect)

print(response)
