def replace_sid(file_path)
  file = File.open(File.expand_path(file_path), 'r')
  original = file.read
  replaced = original.gsub('client:tommy', '{{#voiceCallClient}}{{voiceCallClient}}{{/voiceCallClient}}')

  unless original == replaced
    puts "replaced: #{file_path}"
    File.open(File.expand_path(file_path), 'w') { |document| document.write(replaced) }
  end

  file.close
rescue
  puts "Error replacing content in file: #{file_path}"
end

Dir.glob("rest/making-calls/**/*") do |file|
  next if file.index(/^tools\//) || file.include?('nuget/') || file.include?('vendor/') || file.include?('testable_snippets/')
  replace_sid(file) unless File.directory?(file)
end

Dir.glob("rest/messages/send-message/**/*") do |file|
  next if file.index(/^tools\//) || file.include?('nuget/') || file.include?('vendor/') || file.include?('testable_snippets/')
  replace_sid(file) unless File.directory?(file)
end
