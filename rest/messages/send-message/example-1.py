from twilio.rest import TwilioRestClient 
 
# put your own credentials here 
ACCOUNT_SID = "{{ account_sid }}" 
AUTH_TOKEN = "[AuthToken]" 
 
client = TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN) 
 
client.messages.create(
    to="+16518675309", 
    from_="+14158141829", 
    body="Hey Jenny! Good luck on the bar exam!", 
    media_url="http://farm2.static.flickr.com/1075/1404618563_3ed9a44a3a.jpg", 
)