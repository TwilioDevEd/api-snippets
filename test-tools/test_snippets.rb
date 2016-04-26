TWILIO_ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
TWILIO_AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']

file = File.open(File.expand_path('rest/accounts/instance-get-example-1/instance-get-example-1.py'))
content = file.read

puts content

content = content.gsub('ACba8bc05eacf94afdae398e642c9cc32d', TWILIO_ACCOUNT_SID)
content = content.gsub('{{ auth_token }}', TWILIO_AUTH_TOKEN)

puts content

File.open('parsed.py', 'w') { |file| file.write(content) }

out = system('python parsed.py')

Kernel.exit(out)

puts 'worked'