module HelperMethods
  def self.replace_account_sid(file_path)
    File.open(File.expand_path(file_path), 'wr') do |file|
      original = file.read
      replaced = original.gsub(/AC\w{32}/, '{{ account_sid }}')

      file.write(replaced) unless original == replaced
    end


  end
end