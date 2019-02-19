require 'pg'
require 'json'

search_path = ARGV.first

conn = PG.connect(dbname: 'wagtail_twilio')

conn.prepare('select_sample', 'SELECT id, path FROM code_samples_codesample WHERE path=$1')
code_sample_result = conn.exec_prepared('select_sample', [search_path])
code_sample = code_sample_result.first
code_sample_result.clear

if code_sample.nil?
  puts 'snippet path not found'
  exit(0)
end

pages = []

api_pages_result = conn.exec('SELECT page_ptr_id id, body FROM api_reference_apireferencepage')

api_pages_result.each do |row|
  page = JSON.parse(row['body'])
  sample_sections = page.select { |section| section['type'] == 'code_sample' }
  sample_ids = sample_sections.map { |sample| sample['value'] }

  sample_ids.each do |id|
    pages.push(row['id']) if id.to_s == code_sample['id']
  end
end
api_pages_result.clear

puts "Snippet #{search_path} is used in the pages with the following ids:"

pages.each do |page|
  puts page
end
