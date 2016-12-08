grant = Twilio::Util::AccessToken::IpMessagingGrant.new
grant.service_sid = ENV['TWILIO_IPM_SERVICE_SID']
grant.endpoint_id = endpoint_id
grant.push_credential_sid = 'CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
