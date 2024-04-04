grant = Twilio::Util::AccessToken::ChatGrant.new
# To set up environmental variables, see http://twil.io/secure
grant.service_sid = ENV['TWILIO_CHAT_SERVICE_SID']
grant.endpoint_id = endpoint_id
grant.push_credential_sid = 'CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
