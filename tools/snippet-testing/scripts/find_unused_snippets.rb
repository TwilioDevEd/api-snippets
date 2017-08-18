require 'pg'
require 'json'

conn = PG.connect(dbname: 'wagtail_twilio')

code_samples_result = conn.exec('SELECT path, id FROM code_samples_codesample')
code_samples = code_samples_result.inject({}) do |result, row|
  id   = row['id']
  path = row['path']
  result.merge(id.to_s => { path: path, used: false })
end
code_samples_result.clear

api_pages_result = conn.exec('SELECT body FROM api_reference_apireferencepage')

api_pages_result.each do |row|
  page = JSON.parse(row['body'])
  sample_sections = page.select { |section| section['type'] == 'code_sample' }
  sample_ids = sample_sections.map { |sample| sample['value'] }
  sample_ids.each do |id|
    code_samples.fetch(id.to_s)[:used] = true
  end
end
api_pages_result.clear

unused_samples = code_samples.reject { |_, sample| sample[:used] }

conn.prepare('delete_sample', 'DELETE FROM code_samples_codesample WHERE id=$1')
unused_samples.each do |key, value|
  puts "#id: #{key}, path: #{value[:path]}"
  # snippets can be removed here from api-snippets if running at the root dir
  # system("rm -rf #{value['path']}")

  # snippets can be removed from the db
  # conn.exec_prepared('delete_sample', [key])
end
