Dir['lib/**/*.rb'].each do |ruby_file|
  require ruby_file.gsub('lib/', '')
end