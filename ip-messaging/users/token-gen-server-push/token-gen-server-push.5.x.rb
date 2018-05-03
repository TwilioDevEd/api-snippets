grant = Twilio::Util::AccessToken::ChatGrant.new
grant.service_sid = ENV['TWILIO_CHAT_SERVICE_SID']
grant.endpoint_id = endpoint_id
grant.push_credential_sid = 'CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
