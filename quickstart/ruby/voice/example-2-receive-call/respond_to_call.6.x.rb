require 'bundler'
Bundler.require()

def self.get_or_post(url,&block)
  get(url,&block)
  post(url,&block)
end

get_or_post '/answer' do

	Twilio::TwiML::VoiceResponse.new do |r|
		r.say(message: "Thank you for calling! Have a great day.")
	end.to_s

end