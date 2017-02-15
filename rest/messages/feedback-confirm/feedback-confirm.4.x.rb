require 'sinatra'

post '/confirm' do
  unique_id = params['id']
  # Lookup variable `unique_id` in a database to find message_sid
  message_sid = 'SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

  # TODO: Implement
end
