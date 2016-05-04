def replace_account_sid(file_path)
  file = File.open(File.expand_path(file_path), 'r')
  original = file.read
  replaced = original.gsub('{{ account_sid }}', 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  replaced = replaced.gsub('{AuthToken}', '{{ auth_token }}')

  # This was the original replace
  # replaced = original.gsub(/AC\w{32}/, '{{ account_sid }}')
  # replaced = replaced.gsub('{AuthToken}', '{{ auth_token }}')

  unless original == replaced
    puts replaced
    File.open(File.expand_path(file_path), 'w') { |document| document.write(replaced) }
  end

  file.close
end

Dir.glob("**/*") do |file|
  next if file.include?('snippet-testing')
  replace_account_sid(file) unless File.directory?(file)
end