placeholders = []

Dir.glob('**/*') do |file|
  next if file.index(/^tools\//) || file.include?('nuget/') || file.include?('vendor/') || file.include?('testable_snippets/')

  unless File.directory?(file)
    file = File.open(File.expand_path(file), 'r')
    original = file.read
    results = original.scan(/\{\{[^\{\}]+\}\}/)
    results.each do |match|
      next if placeholders.include?(match)
      # puts File.path(file) # First ocurrence of the placeholder
      puts match
      placeholders.push(match)
    end
  end
end
