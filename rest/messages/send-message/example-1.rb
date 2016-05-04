require 'rubygems' # not necessary with ruby 1.9 but included for completeness 
require 'twilio-ruby' 
 
# put your own credentials here 
account_sid = '{{ account_sid }}' 
auth_token = '[AuthToken]' 
 
# set up a client to talk to the Twilio REST API 
@client = Twilio::REST::Client.new account_sid, auth_token 
 
@client.account.messages.create({
  :from => '+14158141829', 
  :to => '+16518675309', 
  :body => 'Hey Jenny! Good luck on the bar exam!', 
  :media_url => 'http://farm2.static.flickr.com/1075/1404618563_3ed9a44a3a.jpg', 
})