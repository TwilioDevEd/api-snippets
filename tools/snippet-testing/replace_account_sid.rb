require_relative 'helper_methods'

Dir.glob("**/*") do |file|
  HelperMethods.replace_account_sid file unless File.directory?(file)
end