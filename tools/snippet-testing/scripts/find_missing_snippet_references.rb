require 'pg'
require 'json'

conn = PG.connect(dbname: 'wagtail_twilio')

code_samples_result = conn.exec('SELECT path, id FROM code_samples_codesample')
code_samples_ids = code_samples_result.inject([]) do |result, row|
  result.push(row['id'])
end
code_samples_result.clear

api_pages_result = conn.exec('SELECT body, page_ptr_id id FROM api_reference_apireferencepage')

pages_with_errors = []

api_pages_result.each do |row|
  page = JSON.parse(row['body'])
  page_id = row['id']
  sample_sections = page.select { |section| section['type'] == 'code_sample' }
  sample_ids = sample_sections.map { |sample| sample['value'] }
  sample_ids.each do |id|
    pages_with_errors.push(page_id) unless code_samples_ids.include?(id.to_s)
  end
end
api_pages_result.clear

if pages_with_errors.empty?
  puts 'Hooray! No pages with missing snippet references were found'
else
  pages_with_errors.each do |page|
    puts "Missing snippet in page #{page}"
  end
end
