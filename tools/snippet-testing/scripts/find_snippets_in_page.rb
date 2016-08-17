require 'pg'
require 'json'

search_path = ARGV.first

conn = PG.connect(dbname: 'wagtail_twilio')

conn.prepare('select_page', 'SELECT body FROM api_reference_apireferencepage WHERE page_ptr_id=$1')

page_result = conn.exec_prepared('select_page', [search_path])
page = page_result.first
page_result.clear

if page.nil?
  puts "Page with id: #{search_path} not found"
  exit(0)
end

content = JSON.parse(page['body'])
sample_sections = content.select { |section| section['type'] == 'code_sample' }
sample_ids = sample_sections.map { |sample| sample['value'] }

puts sample_ids
