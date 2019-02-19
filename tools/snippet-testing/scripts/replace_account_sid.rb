def replace_account_sid(file_path)
  file = File.open(File.expand_path(file_path), 'r')
  original = file.read
  replaced = original.gsub('WFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', 'WWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

  unless original == replaced
    puts "replaced: #{file_path}"
    File.open(File.expand_path(file_path), 'w') { |document| document.write(replaced) }
  end

  file.close
rescue
  puts "Error replacing content in file: #{file_path}"
end

Dir.glob('**/*') do |file|
  next if file.index(/^tools\//) || file.include?('nuget/') || file.include?('vendor/') || file.include?('testable_snippets/')
  replace_account_sid(file) unless File.directory?(file)
end
