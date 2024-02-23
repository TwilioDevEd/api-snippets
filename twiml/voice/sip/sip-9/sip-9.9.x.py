from twilio.twiml.voice_response import Dial, VoiceResponse, Sip

response = VoiceResponse()
dial = Dial(
    record='record-from-answer',
    timeout=10,
    hangup_on_star=True,
    caller_id='bob',
    method='POST',
    action='/handle_post_dial'
)
dial.sip(
    'sip:kate@example.com?x-customheader=foo',
    method='POST',
    url='/handle_screening_on_answer'
)
response.append(dial)

print(response)
