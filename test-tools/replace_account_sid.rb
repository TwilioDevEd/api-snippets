require_relative 'helper_methods'

BASE_PATH = File.expand_path('./')

# puts Dir.entries('.')

Dir.glob("**/*") do |file|
  HelperMethods.replace_account_sid file
end

# Dir.foreach(BASE_PATH) do |item|
#   next if item == '.' or item == '..'
#   puts item
# end